all:
	corral run -- ponyc -o ./build/ ./stringExt
	./build/stringExt

test:
	corral run -- ponyc -V=0 -o ./build/ ./stringExt
	./build/stringExt




corral-fetch:
	@corral clean -q
	@corral fetch -q

corral-local:
	@-rm corral.json
	@-rm lock.json
	@corral init -q

corral-git:
	@-rm corral.json
	@-rm lock.json
	@corral init -q

ci: corral-git corral-fetch all
	
dev: corral-local corral-fetch all
