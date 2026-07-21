# otp-build

[![Sponsor cocoa-xu](https://img.shields.io/github/sponsors/cocoa-xu?label=Sponsor&logo=github&color=ea4aaa)](https://github.com/sponsors/cocoa-xu)

Precompiled OTP for NIF library CI builds.

## Availability

Precompiled Erlang/OTP grouped by major version — ✓ marks the platforms that have a build. Grab the `otp-<triplet>.tar.gz` for your OS / ABI / architecture from that version's release, or use the [GitHub Action](#github-action) below.

### Erlang/OTP 29

<table>
<thead>
  <tr>
    <td></td><td></td><td><b>NIF Version →</b></td>
    <td>2.18</td>
  </tr>
  <tr>
    <td><b>OS</b></td><td><b>ABI</b></td><td><b>Arch \ OTP →</b></td>
    <td>29.0-29.0.2</td>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="13">Linux</td>
    <td rowspan="7">gnu</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i686</td>
    <td>✓<sup>1</sup></td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>armv7l</td>
    <td>✓<sup>1</sup></td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="6">musl</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i386</td>
    <td>✓<sup>1</sup></td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">macOS</td>
    <td>darwin</td>
    <td>arm64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>darwin</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">FreeBSD</td>
    <td>13</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>14</td>
    <td>x86_64</td>
    <td></td>
  </tr>
  <tr>
    <td rowspan="1">NetBSD</td>
    <td>9</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="1">OpenBSD</td>
    <td>7</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
</tbody>
</table>

### Erlang/OTP 28

<table>
<thead>
  <tr>
    <td></td><td></td><td><b>NIF Version →</b></td>
    <td>2.17</td>
  </tr>
  <tr>
    <td><b>OS</b></td><td><b>ABI</b></td><td><b>Arch \ OTP →</b></td>
    <td>28.0-28.5.0.2</td>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="13">Linux</td>
    <td rowspan="7">gnu</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i686</td>
    <td>✓<sup>1</sup></td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>armv7l</td>
    <td>✓<sup>1</sup></td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="6">musl</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i386</td>
    <td>✓<sup>1</sup></td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">macOS</td>
    <td>darwin</td>
    <td>arm64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>darwin</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">FreeBSD</td>
    <td>13</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>14</td>
    <td>x86_64</td>
    <td></td>
  </tr>
  <tr>
    <td rowspan="1">NetBSD</td>
    <td>9</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="1">OpenBSD</td>
    <td>7</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
</tbody>
</table>

### Erlang/OTP 27

<table>
<thead>
  <tr>
    <td></td><td></td><td><b>NIF Version →</b></td>
    <td>2.17</td>
    <td>2.17</td>
    <td>2.17</td>
    <td>2.17</td>
    <td>2.17</td>
  </tr>
  <tr>
    <td><b>OS</b></td><td><b>ABI</b></td><td><b>Arch \ OTP →</b></td>
    <td>27.0</td>
    <td>27.0.1-27.1</td>
    <td>27.1.1</td>
    <td>27.1.2</td>
    <td>27.3-27.3.4.13</td>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="13">Linux</td>
    <td rowspan="7">gnu</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i686</td>
    <td>✓<sup>1</sup></td>
    <td>✓<sup>1</sup></td>
    <td>✓<sup>1</sup></td>
    <td>✓<sup>1</sup></td>
    <td>✓<sup>1</sup></td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>armv7l</td>
    <td></td>
    <td></td>
    <td>✓<sup>1</sup></td>
    <td>✓<sup>1</sup></td>
    <td>✓<sup>1</sup></td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="6">musl</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i386</td>
    <td>✓<sup>1</sup></td>
    <td>✓<sup>1</sup></td>
    <td>✓<sup>1</sup></td>
    <td>✓<sup>1</sup></td>
    <td>✓<sup>1</sup></td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">macOS</td>
    <td>darwin</td>
    <td>arm64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>darwin</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">FreeBSD</td>
    <td>13</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>14</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td></td>
  </tr>
  <tr>
    <td rowspan="1">NetBSD</td>
    <td>9</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="1">OpenBSD</td>
    <td>7</td>
    <td>x86_64</td>
    <td>✓</td>
    <td></td>
    <td></td>
    <td>✓</td>
    <td>✓</td>
  </tr>
</tbody>
</table>

### Erlang/OTP 26

<table>
<thead>
  <tr>
    <td></td><td></td><td><b>NIF Version →</b></td>
    <td>2.16</td>
  </tr>
  <tr>
    <td><b>OS</b></td><td><b>ABI</b></td><td><b>Arch \ OTP →</b></td>
    <td>26.0-26.2.5.4</td>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="13">Linux</td>
    <td rowspan="7">gnu</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i686</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>armv7l</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="6">musl</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i386</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">macOS</td>
    <td>darwin</td>
    <td>arm64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>darwin</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">FreeBSD</td>
    <td>13</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>14</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="1">NetBSD</td>
    <td>9</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="1">OpenBSD</td>
    <td>7</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
</tbody>
</table>

### Erlang/OTP 25

<table>
<thead>
  <tr>
    <td></td><td></td><td><b>NIF Version →</b></td>
    <td>2.16</td>
  </tr>
  <tr>
    <td><b>OS</b></td><td><b>ABI</b></td><td><b>Arch \ OTP →</b></td>
    <td>25.0-25.3.2.14</td>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="13">Linux</td>
    <td rowspan="7">gnu</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i686</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>armv7l</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="6">musl</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i386</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">macOS</td>
    <td>darwin</td>
    <td>arm64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>darwin</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">FreeBSD</td>
    <td>13</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>14</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="1">NetBSD</td>
    <td>9</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="1">OpenBSD</td>
    <td>7</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
</tbody>
</table>

### Erlang/OTP 24

<table>
<thead>
  <tr>
    <td></td><td></td><td><b>NIF Version →</b></td>
    <td>2.16</td>
    <td>2.15</td>
  </tr>
  <tr>
    <td><b>OS</b></td><td><b>ABI</b></td><td><b>Arch \ OTP →</b></td>
    <td>24.3-24.3.4.17</td>
    <td>24.0-24.2.2</td>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="13">Linux</td>
    <td rowspan="7">gnu</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i686</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>armv7l</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="6">musl</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i386</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td></td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">macOS</td>
    <td>darwin</td>
    <td>arm64</td>
    <td>✓</td>
    <td></td>
  </tr>
  <tr>
    <td>darwin</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">FreeBSD</td>
    <td>13</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>14</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="1">NetBSD</td>
    <td>9</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="1">OpenBSD</td>
    <td>7</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
</tbody>
</table>

### Erlang/OTP 23

<table>
<thead>
  <tr>
    <td></td><td></td><td><b>NIF Version →</b></td>
    <td>2.15</td>
  </tr>
  <tr>
    <td><b>OS</b></td><td><b>ABI</b></td><td><b>Arch \ OTP →</b></td>
    <td>23.3.4.19-23.3.4.20</td>
  </tr>
</thead>
<tbody>
  <tr>
    <td rowspan="13">Linux</td>
    <td rowspan="7">gnu</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i686</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>armv7l</td>
    <td></td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td></td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="6">musl</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i386</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td></td>
  </tr>
  <tr>
    <td>ppc64le</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">macOS</td>
    <td>darwin</td>
    <td>arm64</td>
    <td></td>
  </tr>
  <tr>
    <td>darwin</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">FreeBSD</td>
    <td>13</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>14</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="1">NetBSD</td>
    <td>9</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="1">OpenBSD</td>
    <td>7</td>
    <td>x86_64</td>
    <td>✓</td>
  </tr>
</tbody>
</table>


<footer>
  
  *1. Compiled with `--disable-year2038` from OTP 27.0 and onwards*
  
</footer>

## GitHub Action

Install a precompiled Erlang/OTP in a single step:

```yaml
      - name: Install OTP
        uses: cocoa-xu/otp-build@v1
        with:
          otp_version: '27.0'

      - run: erl -version
```

`otp_version` accepts an exact version **or** an Elixir-style requirement. The
action resolves it to the newest release that satisfies the requirement *and*
has a build for the runner's platform:

| `otp_version` | resolves to |
|---|---|
| `27.0` | exactly `27.0` (the release must exist) |
| `~> 27` | newest `27.x` |
| `~> 27.1` | newest `>= 27.1` and `< 28` |
| `~> 27.3.4` | newest `>= 27.3.4` and `< 27.4` |
| `>= 26.2` | newest `>= 26.2` |
| `< 28` | newest `< 28` |

The platform (Linux gnu/musl or macOS, across the architectures in the table
above) is detected automatically; the matching `otp-<triplet>.tar.gz` is
downloaded and extracted, OTP's `bin` is appended to `PATH`, and `ERL_ROOTDIR`
is exported.

### Inputs

| input | default | description |
|---|---|---|
| `otp_version` | — | exact version or requirement (required) |
| `install-dir` | `.otp` | directory to extract into |
| `add-to-path` | `true` | append OTP `bin` to `PATH` |
| `repository` | `cocoa-xu/otp-build` | release source |
| `token` | `${{ github.token }}` | used to list releases when resolving a requirement (exact versions need none) |

### Outputs

`otp-version` (the resolved version), `install-dir`, `bindir`, `erl-rootdir`, and `triplet`.

## Example

### Without Action Cache

```yaml
name: ci

on:
  pull_request:
  push:
    branches:
      - main

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:
  mix_test:
    runs-on: macos-12
    env:
      OTP_VERSION: "26.2.3"
      ELIXIR_VERSION: "1.16.2"

    steps:
      # this will clone and setup your repo
      - uses: actions/checkout@v7

      # Download precompiled Erlang/OTP
      - name: Download Erlang/OTP
        run: |
          # set the triplet for your platform
          TRIPLET=x86_64-apple-darwin

          mkdir -p ./cache/otp
          curl -fSL https://github.com/cocoa-xu/otp-build/releases/download/v${{ env.OTP_VERSION }}/otp-${TRIPLET}.tar.gz -o ./cache/otp/otp-v${{ env.OTP_VERSION }}-${TRIPLET}.tar.gz
          cd ./cache/otp
          tar -xzf otp-v${{ env.OTP_VERSION }}-${TRIPLET}.tar.gz

      # Download and Compile Elixir (optional)
      - name: Download and Compile Elixir
        run: |
          export PATH=$(pwd)/./cache/otp/usr/local/bin:$(pwd)/./cache/elixir/elixir-${{ env.ELIXIR_VERSION }}/bin:${PATH}
          export ERL_ROOTDIR=$(pwd)/./cache/otp/usr/local/lib/erlang

          mkdir -p ./cache/elixir
          curl -fSL https://github.com/elixir-lang/elixir/archive/refs/tags/v${{ env.ELIXIR_VERSION }}.tar.gz -o ./cache/elixir/elixir-${{ env.ELIXIR_VERSION }}.tar.gz
          cd ./cache/elixir
          tar -xzf elixir-${{ env.ELIXIR_VERSION }}.tar.gz
          cd elixir-${{ env.ELIXIR_VERSION }}
          make -j$(sysctl -n hw.ncpu) install

          mix local.hex --force
          mix local.rebar --force

      # and we're almost ready for using precompiled Erlang/OTP now
      # we just have to set the PATH and ERL_ROOTDIR env var
      - name: Use precompiled Erlang
        run: |
          export PATH=$(pwd)/./cache/otp/usr/local/bin:$(pwd)/./cache/elixir/elixir-${{ env.ELIXIR_VERSION }}/bin:${PATH}
          export ERL_ROOTDIR=$(pwd)/./cache/otp/usr/local/lib/erlang
          
          # do work below, e.g.,
          # mix test
```

### With Action Cache

```yaml
name: ci

on:
  pull_request:
  push:
    branches:
      - main

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:
  mix_test:
    runs-on: macos-12
    env:
      OTP_VERSION: "26.2.3"
      ELIXIR_VERSION: "1.16.2"

    steps:
      # This will clone and setup your repo
      - uses: actions/checkout@v7

      # Cache precompiled Erlang/OTP for speedup
      - name: Cache OTP
        uses: actions/cache@v3
        id: cache-otp
        with:
          path: ./cache/otp
          key: ${{ runner.os }}-otp-${{ env.OTP_VERSION }}

      # Download precompiled Erlang/OTP if there's a cache miss
      - name: Download OTP
        if: steps.cache-otp.outputs.cache-hit != 'true'
        run: |
          mkdir -p ./cache/otp
          curl -fSL https://cocoa.build/otp/v${{ env.OTP_VERSION }}/otp-x86_64-apple-darwin.tar.gz -o ./cache/otp/otp-v${{ env.OTP_VERSION }}-x86_64-apple-darwin.tar.gz
          cd ./cache/otp
          tar -xzf otp-v${{ env.OTP_VERSION }}-x86_64-apple-darwin.tar.gz

      # Cache Elixir (optional)
      # Download and compile Elixir (optional)
      #
      # these two steps below will setup cache for Elixir,
      # and if there's a cache miss, it will download and compile Elixir,
      # compiled binaries will be saved in the cache for speedup
      #
      # however, it's not necessary for libraries that only needs Erlang/OTP
      # and of course, you can download precompiled Elixir from the its offical repo
      # and setup corresponding env var by yourself
      - name: Cache Elixir
        id: cache-elixir
        uses: actions/cache@v3
        with:
          path: ./cache/elixir
          key: ${{ runner.os }}-elixir-${{ env.ELIXIR_VERSION }}

      - name: Download and Compile Elixir
        if: steps.cache-elixir.outputs.cache-hit != 'true'
        run: |
          export PATH=$(pwd)/./cache/otp/usr/local/bin:$(pwd)/./cache/elixir/elixir-${{ env.ELIXIR_VERSION }}/bin:${PATH}
          export ERL_ROOTDIR=$(pwd)/./cache/otp/usr/local/lib/erlang
          mkdir -p ./cache/elixir
          curl -fSL https://github.com/elixir-lang/elixir/archive/refs/tags/v${{ env.ELIXIR_VERSION }}.tar.gz -o ./cache/elixir/elixir-${{ env.ELIXIR_VERSION }}.tar.gz
          cd ./cache/elixir
          tar -xzf elixir-${{ env.ELIXIR_VERSION }}.tar.gz
          cd elixir-${{ env.ELIXIR_VERSION }}
          make -j$(sysctl -n hw.ncpu) install

      # In this example, we install mix and rebar in a separate step
      # and won't do cache for them
      - name: Install Mix and Rebar
        run: |
          export PATH=$(pwd)/./cache/otp/usr/local/bin:$(pwd)/./cache/elixir/elixir-${{ env.ELIXIR_VERSION }}/bin:${PATH}
          export ERL_ROOTDIR=$(pwd)/./cache/otp/usr/local/lib/erlang
          mix local.hex --force
          mix local.rebar --force

      # And we're almost ready for using precompiled Erlang/OTP now
      # we just have to set the PATH and ERL_ROOTDIR env var
      - name: Use precompiled Erlang
        run: |
          export PATH=$(pwd)/./cache/otp/usr/local/bin:$(pwd)/./cache/elixir/elixir-${{ env.ELIXIR_VERSION }}/bin:${PATH}
          export ERL_ROOTDIR=$(pwd)/./cache/otp/usr/local/lib/erlang
          
          # do work below, e.g.,
          # mix test
```

## Build Dependencies

Nothing here is compiled from source — the build jobs pull precompiled artifacts from my other repos:

- **[cocoa-xu/openssl-build](https://github.com/cocoa-xu/openssl-build)** — OpenSSL `3.6.3`, or `1.1.1w` for OTP 24 and below, linked statically
  - Linux (gnu) · Linux (musl) · macOS · FreeBSD · NetBSD · OpenBSD · Windows (aarch64)
  - **[cocoa-xu/perl-windows-build](https://github.com/cocoa-xu/perl-windows-build)** — perl5, required to configure OpenSSL on Windows
- **[cocoa-xu/wxWidgets-build](https://github.com/cocoa-xu/wxWidgets-build)** — wxWidgets `3.3.3.1`, linked statically
  - Linux (gnu), except i686 · macOS

## Sponsor

[![Sponsor cocoa-xu](https://img.shields.io/github/sponsors/cocoa-xu?label=Sponsor%20cocoa-xu&logo=github&color=ea4aaa)](https://github.com/sponsors/cocoa-xu)

Every OTP release here is rebuilt for ~20 OS/ABI/arch combinations: QEMU-emulated riscv64, ppc64le, s390x and armv7l, FreeBSD/NetBSD/OpenBSD VMs, and self-hosted aarch64 Windows hardware.

If these builds save your CI time, consider sponsoring [@cocoa-xu](https://github.com/sponsors/cocoa-xu).
