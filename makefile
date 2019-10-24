all:
	ponyc -o ./build/ ./stringExt
	./build/stringExt
