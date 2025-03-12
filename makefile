WIT_PACKAGE:=nikpivkin:test@0.1.0.wasm
WIT_WORLD:=test
OUTPUT_FILE:=test.wasm

build-package:
	@wkg wit build

clean:
	@rm -rf internal

generate-bindings: clean
	@go tool -modfile tools.mod \
		go.bytecodealliance.org/cmd/wit-bindgen-go generate -o internal/ $(WIT_PACKAGE)

build:
	@tinygo build -target=wasip2 -o $(OUTPUT_FILE) \
		--wit-package $(WIT_PACKAGE) --wit-world $(WIT_WORLD) main.go

run:
	wasmtime run --dir .::workdir $(OUTPUT_FILE) workdir/testdata/test.json

.PHONY: build-package clean generate-bindings build run