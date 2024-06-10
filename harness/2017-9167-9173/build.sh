#!/bin/bash

if [ ! -d "autotrace-0.31.1" ]; then
	tar -xvf autotrace-0.31.1.tar.gz
fi

if [ ! -d "libpng" ]; then
	git clone https://github.com/pnggroup/libpng.git -b libpng12 libpng
	pushd libpng
	./autogen.sh
	./configure
	make -j$(nproc)
	popd
fi

pushd autotrace-0.31.1

CC=$SHADOWBOUND/llvm-project/build/bin/clang \
CXX=$SHADOWBOUND/llvm-project/build/bin/clang++ \
CFLAGS="-g -fsanitize=overflow-defense -I/2017-9167-9173/libpng -L/2017-9167-9173/libpng/ -lpng" \
CXXFLAGS="-g -fsanitize=overflow-defense -I/2017-9167-9173/libpng -L/2017-9167-9173/libpng/ -lpng" \
LDFLAGS="-fsanitize=overflow-defense -L/2017-9167-9173/libpng/ -lpng" \
./configure

make -j$(nproc)

popd

# ./lame-398/frontend/lame -f -V 9 ./CVE-2015-9101_3.98 /dev/null