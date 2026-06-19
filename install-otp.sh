#!/usr/bin/env bash
# Resolve an Erlang/OTP version requirement and install the matching
# precompiled build from the cocoa-xu/otp-build releases.
#
# Driven by INPUT_* environment variables (set by action.yml). Can also be
# run directly for testing, e.g.:
#   INPUT_OTP_VERSION='~> 27' RESOLVE_ONLY=1 ./install-otp.sh
set -euo pipefail

req="${INPUT_OTP_VERSION:-}"
repo="${INPUT_REPOSITORY:-cocoa-xu/otp-build}"
install_dir="${INPUT_INSTALL_DIR:-.otp}"
add_to_path="${INPUT_ADD_TO_PATH:-true}"
token="${INPUT_TOKEN:-${GH_TOKEN:-${GITHUB_TOKEN:-}}}"
resolve_only="${RESOLVE_ONLY:-}"

err() { echo "::error::$*" >&2; exit 1; }
log() { echo "$*" >&2; }

[ -n "$req" ] || err "otp_version input is required"

# ----------------------------------------------------------------------------
# Detect the platform triplet of the current runner.
# ----------------------------------------------------------------------------
detect_triplet() {
  local os arch a libc
  os="$(uname -s)"
  arch="$(uname -m)"
  case "$os" in
    Linux)
      case "$arch" in
        x86_64|amd64)   a=x86_64 ;;
        aarch64|arm64)  a=aarch64 ;;
        armv7l|armv7*)  a=armv7l ;;
        i?86)           a=i686 ;;
        riscv64)        a=riscv64 ;;
        ppc64le|powerpc64le) a=ppc64le ;;
        s390x)          a=s390x ;;
        *) err "unsupported Linux architecture: $arch" ;;
      esac
      if [ -f /etc/alpine-release ] || (command -v ldd >/dev/null 2>&1 && ldd --version 2>&1 | grep -qi musl); then
        libc=musl
      else
        libc=gnu
      fi
      if [ "$libc" = musl ]; then
        [ "$a" = i686 ] && a=i386   # 32-bit musl artifact is named i386
        printf '%s-linux-musl' "$a"
      elif [ "$a" = armv7l ]; then
        printf 'armv7l-linux-gnueabihf'
      else
        printf '%s-linux-gnu' "$a"
      fi
      ;;
    Darwin)
      case "$arch" in
        arm64)   printf 'arm64-apple-darwin' ;;
        x86_64)  printf 'x86_64-apple-darwin' ;;
        *) err "unsupported macOS architecture: $arch" ;;
      esac
      ;;
    *) err "unsupported OS: $os (this action supports Linux and macOS)" ;;
  esac
}

# ----------------------------------------------------------------------------
# Version comparison (uses sort -V; handles OTP's 2-4 component versions).
# ----------------------------------------------------------------------------
ver_le() { [ "$(printf '%s\n%s\n' "$1" "$2" | sort -V | head -n1)" = "$1" ]; }       # a <= b
ver_lt() { [ "$1" != "$2" ] && ver_le "$1" "$2"; }                                    # a <  b

# Upper bound (exclusive) for a `~>` requirement, per Elixir semantics:
#   ~> 27       -> < 28        ~> 27.1   -> < 28
#   ~> 27.1.0   -> < 27.2.0    ~> 27.3.4 -> < 27.4
tilde_upper() {
  local IFS='.'; local -a p; read -ra p <<<"$1"; local n=${#p[@]}
  if [ "$n" -le 1 ]; then
    echo "$(( p[0] + 1 ))"
  else
    p[n-2]=$(( p[n-2] + 1 )); unset 'p[n-1]'
    echo "${p[*]}"
  fi
}

# ----------------------------------------------------------------------------
# Fetch the list of released OTP versions (numeric tags only, no pre-releases).
# ----------------------------------------------------------------------------
list_versions() {
  local auth=() page=1 body
  [ -n "$token" ] && auth=(-H "Authorization: Bearer $token")
  while :; do
    body="$(curl -fsSL "${auth[@]}" -H 'Accept: application/vnd.github+json' \
      "https://api.github.com/repos/$repo/releases?per_page=100&page=$page" 2>/dev/null)" || break
    [ "$body" = "[]" ] || [ -z "$body" ] && break
    printf '%s' "$body" | grep -oE '"tag_name":[[:space:]]*"v?[^"]+"' \
      | sed -E 's/.*"v?([^"]+)"/\1/'
    page=$((page+1)); [ "$page" -gt 10 ] && break
  done | grep -E '^[0-9]+(\.[0-9]+)+$' | sort -uV
}

# ----------------------------------------------------------------------------
# Parse the requirement into (op, ver). No operator => exact match.
# ----------------------------------------------------------------------------
strip() { echo "$1" | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//'; }
req="$(strip "$req")"
case "$req" in
  "~>"*) op="~>"; ver="$(strip "${req#\~>}")" ;;
  ">="*) op=">="; ver="$(strip "${req#>=}")" ;;
  "<="*) op="<="; ver="$(strip "${req#<=}")" ;;
  "=="*) op="=="; ver="$(strip "${req#==}")" ;;
  ">"*)  op=">";  ver="$(strip "${req#>}")" ;;
  "<"*)  op="<";  ver="$(strip "${req#<}")" ;;
  v[0-9]*) op="=="; ver="${req#v}" ;;
  *)     op="=="; ver="$req" ;;
esac
[ -n "$ver" ] || err "could not parse version requirement: '$req'"

triplet="$(detect_triplet)"
log "Platform: $triplet  |  requirement: ${op} ${ver}"

asset_ok() { # version -> 0 if otp-<triplet>.tar.gz exists for it
  local code
  code="$(curl -s -o /dev/null -w '%{http_code}' -I -L \
    "https://github.com/$repo/releases/download/v$1/otp-$triplet.tar.gz" 2>/dev/null || echo 000)"
  [ "$code" = 200 ]
}

# ----------------------------------------------------------------------------
# Resolve to a concrete version that actually has an artifact for this platform.
# ----------------------------------------------------------------------------
resolved=""
if [ "$op" = "==" ]; then
  asset_ok "$ver" && resolved="$ver" \
    || err "OTP $ver has no precompiled build for $triplet (exact match)"
else
  upper=""; if [ "$op" = "~>" ]; then upper="$(tilde_upper "$ver")"; fi
  # candidate versions matching the constraint, highest first
  candidates="$(list_versions | while read -r v; do
      case "$op" in
        "~>") if ver_le "$ver" "$v" && ver_lt "$v" "$upper"; then echo "$v"; fi ;;
        ">=") if ver_le "$ver" "$v"; then echo "$v"; fi ;;
        ">")  if ver_lt "$ver" "$v"; then echo "$v"; fi ;;
        "<=") if ver_le "$v" "$ver"; then echo "$v"; fi ;;
        "<")  if ver_lt "$v" "$ver"; then echo "$v"; fi ;;
      esac
    done | sort -rV)"
  [ -n "$candidates" ] || err "no OTP release satisfies '${op} ${ver}'"
  while read -r v; do
    [ -z "$v" ] && continue
    if asset_ok "$v"; then resolved="$v"; break; fi
    log "  (skipping $v — no $triplet build)"
  done <<<"$candidates"
  [ -n "$resolved" ] || err "no OTP release satisfying '${op} ${ver}' has a $triplet build"
fi

log "Resolved '${req}' -> OTP ${resolved}"

# Emit step outputs if running under Actions.
if [ -n "${GITHUB_OUTPUT:-}" ]; then
  {
    echo "otp-version=$resolved"
    echo "triplet=$triplet"
  } >> "$GITHUB_OUTPUT"
fi
[ -n "$resolve_only" ] && { echo "$resolved"; exit 0; }

# ----------------------------------------------------------------------------
# Download, extract, and wire up PATH / ERL_ROOTDIR.
# ----------------------------------------------------------------------------
mkdir -p "$install_dir"
install_dir="$(cd "$install_dir" && pwd)"
url="https://github.com/$repo/releases/download/v$resolved/otp-$triplet.tar.gz"
log "Downloading $url"
curl -fSL --retry 3 --retry-all-errors "$url" -o "$install_dir/otp.tar.gz" \
  || err "failed to download $url"
tar -xzf "$install_dir/otp.tar.gz" -C "$install_dir"
rm -f "$install_dir/otp.tar.gz"

erl_bin="$install_dir/usr/local/bin"
erl_root="$install_dir/usr/local/lib/erlang"
[ -x "$erl_bin/erl" ] || err "extracted archive does not contain usr/local/bin/erl"

if [ "$add_to_path" = "true" ] && [ -n "${GITHUB_PATH:-}" ]; then
  echo "$erl_bin" >> "$GITHUB_PATH"
fi
if [ -n "${GITHUB_ENV:-}" ]; then
  echo "ERL_ROOTDIR=$erl_root" >> "$GITHUB_ENV"
fi
if [ -n "${GITHUB_OUTPUT:-}" ]; then
  {
    echo "install-dir=$install_dir"
    echo "bindir=$erl_bin"
    echo "erl-rootdir=$erl_root"
  } >> "$GITHUB_OUTPUT"
fi

log "Erlang/OTP ${resolved} installed to ${install_dir}"
ERL_ROOTDIR="$erl_root" "$erl_bin/erl" -noshell -eval \
  'io:format("OTP ~s / ERTS ~s~n",[erlang:system_info(otp_release),erlang:system_info(version)]), halt().' \
  2>/dev/null || log "(note: could not run erl to print version; PATH/ERL_ROOTDIR are still set)"
