all: build

build:
	${MAKE} -C llvm $@
	${MAKE} -C fixlang $@
	${MAKE} -C fixlang_minilib_ci $@

push:
	${MAKE} -C llvm $@
	${MAKE} -C fixlang $@
	${MAKE} -C fixlang_minilib_ci $@
