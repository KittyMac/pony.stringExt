all:
	/Volumes/Development/Development/pony/ponyc/build/release/ponyc -o ./build/ ./stringExt
	./build/stringExt

test:
	/Volumes/Development/Development/pony/ponyc/build/release/ponyc -V=0 -o ./build/ ./stringExt
	./build/stringExt
