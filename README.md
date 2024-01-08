# otp-build

Precompiled OTP for NIF library CI builds.

### Availability

<table>
<thead>
  <tr>
    <th colspan="2" rowspan="2">Availability<br></th>
    <th colspan="3">Erlang/OTP Versions</th>
  </tr>
  <tr>
    <th>26.2.1</th>
    <th>25.3.2.8</th>
    <th>24.3.4.15</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Linux</td>
    <td>x86_64-linux-gnu</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td></td>
    <td>i686-linux-gnu</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td></td>
    <td>aarch64-linux-gnu</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td></td>
    <td>ppc64le-linux-gnu</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td></td>
    <td>s390x-linux-gnu</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td rowspan="2">macOS</td>
    <td>arm64-apple-darwin</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
  <tr>
    <td>x86_64-apple-darwin</td>
    <td>✓</td>
    <td>✓</td>
    <td>✓</td>
  </tr>
</tbody>
</table>

### Available Precompiled Architectures

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
