.PHONY: clean main.wasm run

default: main.wasm

# currently using tinygo off the dev branch 
main.wasm: ; tinygo build -tags purego -o main.wasm -target=wasip2 -wit-package ../wit/wit --wit-world platform 

# TODO:(remove) this is not needed if using wit-bindgen-go and the latest tinygo dev release which includes wasip2 
#main.embed.wasm: main.wasm ; wasm-tools component embed ../wit/wit -w platform main.wasm -o main.embed.wasm
# TODO:(remove) this is not needed if using wit-bindgen-go and the latest tinygo dev release which includes wasip2
#main.component.wasm: main.embed.wasm ; wasm-tools component new main.embed.wasm -o main.component.wasm --adapt ./wasi_snapshot_preview1.reactor.wasm

clean: ; rm -rf main*.wasm & rm -rf main*.wat

wit: ; wasm-tools component wit main.wasm

wat: ; wasm-tools parse -t  main.wasm -o main.wat

run: main.wasm ; WASMTIME_LOG=wasmtime_wasi=trace WASMTIME_BACKTRACE_DETAILS=1 wasmtime -S http --wasm component-model main.wasm
