# otp-build

Precompiled OTP for NIF library CI builds.

### Availability

<table>
<thead>
  <tr>
    <th colspan="6">Availability<br></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td></td>
    <td></td>
    <td><b>NIF Version →</b></td>
    <td>2.17</td>
    <td colspan="2">2.16</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td><b>Erlang/OTP Version →</b></td>
    <td>26.0-26.2.3</td>
    <td>25.0-25.3.2.9</td>
    <td>24.3.4.13-24.3.4.16</td>
  </tr>
  <tr>
    <td><b>OS ↓</b></td>
    <td><b>ABI ↓</b></td>
    <td><b>Architecture ↓</b></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td rowspan="12">Linux</td>
    <td rowspan="6">gnu</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>i686</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppcle64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
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
  </tr>
  <tr>
    <td>i686</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>aarch64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>riscv64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>ppcle64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>s390x</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">macOS</td>
    <td rowspan="2">darwin</td>
    <td>arm64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>x86_64</td>
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
  </tr>
  <tr>
    <td>14</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>OpenBSD</td>
    <td>7</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>NetBSD</td>
    <td>9</td>
    <td>x86_64</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
</tbody>
</table>

## Example

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
    runs-on: macos-11
    env:
      OTP_VERSION: "26.2.1"
      ELIXIR_VERSION: "1.15.7"

    steps:
      # this will clone and setup your repo
      - uses: actions/checkout@v4

      # cache precompiled Erlang/OTP for speedup
      - name: Cache OTP
        uses: actions/cache@v3
        id: cache-otp
        with:
          path: ./cache/otp
          key: ${{ runner.os }}-otp-${{ env.OTP_VERSION }}

      # download precompiled Erlang/OTP if there's a cache miss
      - name: Download OTP
        if: steps.cache-otp.outputs.cache-hit != 'true'
        run: |
          mkdir -p ./cache/otp
          curl -fSL https://cocoa.build/otp/v${{ env.OTP_VERSION }}/otp-x86_64-apple-darwin.tar.gz -o ./cache/otp/otp-v${{ env.OTP_VERSION }}-x86_64-apple-darwin.tar.gz
          cd ./cache/otp
          tar -xzf otp-v${{ env.OTP_VERSION }}-x86_64-apple-darwin.tar.gz

      # cache Elixir (optional)
      # download and compile Elixir (optional)
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

      # in this example, we install mix and rebar in a separate step
      # and won't do cache for them
      - name: Install Mix and Rebar
        run: |
          export PATH=$(pwd)/./cache/otp/usr/local/bin:$(pwd)/./cache/elixir/elixir-${{ env.ELIXIR_VERSION }}/bin:${PATH}
          export ERL_ROOTDIR=$(pwd)/./cache/otp/usr/local/lib/erlang
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
