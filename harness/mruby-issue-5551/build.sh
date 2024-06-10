#!/bin/bash

DIR=$(cd "$(dirname "$0")"; pwd)
if [ ! -d "$DIR/mruby" ]; then
  git clone https://github.com/mruby/mruby.git
fi

cd mruby
git reset --hard a844f8965584c0737c436cfaf98bdccdf8d8b39e^

make \
  CC=$SHADOWBOUND/llvm-project/build/bin/clang \
  CXX=$SHADOWBOUND/llvm-project/build/bin/clang++ \
  CFLAGS="-g -fsanitize=overflow-defense" \
  CXXFLAGS="-g -fsanitize=overflow-defense" \
  LDFLAGS="-fsanitize=overflow-defense" -j`nproc` || true

# ./mruby/bin/mruby poc.rb