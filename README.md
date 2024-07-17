wasm-tools component embed --world=client ../wit/wit main.wasm -o main.clientembed.wasm
wasm-tools component embed --world=app ../wit/wit main.clientembed.wasm -o main.app.wasm
wasm-tools component new -o main.component.wasm --adapt wasi_snapshot_preview1=wasi_snapshot_preview1.reactor.wasm main.app.wasm
