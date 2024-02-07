all: build

build:
	${MAKE} -C llvmenv $@
	${MAKE} -C fixlang $@
	${MAKE} -C fixlang_minilib_ci $@

push:
	${MAKE} -C llvmenv $@
	${MAKE} -C fixlang $@
	${MAKE} -C fixlang_minilib_ci $@
