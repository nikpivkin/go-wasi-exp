# Experiments with WASI

## Requirements:
- [TinyGo](https://github.com/tinygo-org/tinygo)
- [wkg](https://github.com/bytecodealliance/wasm-pkg-tools)
- [wasmtime](https://github.com/bytecodealliance/wasmtime)

## Usage:
1. Run `make build` to build the command component
2. Run the component:
```bash
❯ wasmtime run --dir .::workdir test.wasm workdir/testdata/test.json
{
    "foo": "bar"
}
```