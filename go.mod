module github.com/hayride-dev/wasi-tinygo

go 1.22.4

replace github.com/hayride-dev/wit => ../wit

replace github.com/hayride-dev/wasi => ../wasi

require github.com/hayride-dev/wasi v0.0.0-20240702043754-81fb9e55919b

require (
	github.com/hayride-dev/wit v0.0.0-20240702232342-661d55c43216 // indirect
	github.com/ydnar/wasm-tools-go v0.1.3 // indirect
)
