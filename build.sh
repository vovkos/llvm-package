#!/bin/bash
set -e

#. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

case "$BUILD_PROJECT" in
"llvm")
	mkdir llvm/build
	pushd llvm/build
	cmake .. $LLVM_CMAKE_FLAGS
	make -j $LLVM_CPU_COUNT
	make install
	popd

	travis_wait 50 tar --${TAR_COMPRESSION} -cvf $LLVM_RELEASE_TAR $LLVM_RELEASE_NAME
	;;

"clang")
	mkdir clang/build
	pushd clang/build
	cmake .. $CLANG_CMAKE_FLAGS
	make -j $CLANG_CPU_COUNT
	make install
	popd

	travis_wait 50 tar --${TAR_COMPRESSION} -cvf $CLANG_RELEASE_TAR $CLANG_RELEASE_NAME
	;;
esac

#. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
