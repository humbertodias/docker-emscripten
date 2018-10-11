build_01:
	docker run --rm -v $(PWD)/01_c_helloworld:/src trzeci/emscripten \
	emcc -O1 main.c -s WASM=1 -o index.html

build_02:
	docker run --rm -v $(PWD)/02_cpp_helloworld:/src trzeci/emscripten \
	em++ -O1 main.cpp -s WASM=1 \
	-s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall","cwrap"]' \
	-s EXPORTED_FUNCTIONS='["_get_greeting"]' \
	-o main.js

03_build:
	docker run --rm -v $(PWD)/03_sdl2_helloworld:/src trzeci/emscripten \
	emcc main.c -O2 -s USE_SDL=2 -s USE_SDL_IMAGE=2 -s SDL2_IMAGE_FORMATS='["png"]' \
    --preload-file assets --emrun \
	-o index.html

docker_emrun:
	docker run -p 8000:8000 -v $(PWD):/src trzeci/emscripten \
	emrun --no_browser --hostname 0.0.0.0 --port 8000 --serve_after_exit --serve_after_close .

clean:
	find . -regex '.*\.\(html\|js\|wasm\)' -delete
