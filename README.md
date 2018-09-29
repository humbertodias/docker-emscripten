# Docker Emscripten

# Play

```
EMCC_CMD="emcc hello.c -s WASM=1 -o hello.html"
docker run --rm -v $(pwd)/src:/src trzeci/emscripten $(echo $EMCC_CMD)
```

# Server

```
emrun --no_browser --port 8000 .
```

Open

http://localhost:8000/src/hello.html

# Output

![](doc/output.png)

# References

* [C to wasm](https://developer.mozilla.org/en-US/docs/WebAssembly/C_to_wasm)

* [Installing Emscripten](https://webassembly.org/getting-started/developers-guide/)