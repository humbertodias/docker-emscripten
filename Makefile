build_01:
	docker run --rm -v $(PWD)/01_c_helloworld:/src trzeci/emscripten \
	emcc -O1 main.c -s WASM=1 -o main.html

build_02:
	docker run --rm -v $(PWD)/02_cpp_helloworld:/src trzeci/emscripten \
	em++ -O1 main.cpp -s WASM=1 \
	-s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall","cwrap"]' \
	-s EXPORTED_FUNCTIONS='["_get_greeting"]' \
	-o main.js

clean:
	find . -regex '.*\.\(html\|js\|wasm\)' -delete
