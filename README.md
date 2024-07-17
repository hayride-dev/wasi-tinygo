# Wasi-tinygo

This repo contains example uses for [hayride-dev/wasi](https://github.com/hayride-dev/wasi). Currently the main focus in on wasi-http and non core wasi implementations.

## Make/run

This repo uses tiny-go and the wasip2 implemenation. We recommend using the dev branch of tinygo and building from source to ensure use of that latest code. 

We are also uses wasmtime and currently have not tested other wasi runtimes.

### Building 

`make` or `make main.wasm` 

### Running 

`make run`

