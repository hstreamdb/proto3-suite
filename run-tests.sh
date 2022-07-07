#!/usr/bin/env sh

cabal build all
mkdir -p gen
for proto in $(find test-files -name 'test_*.proto'); do
  cabal run compile-proto-file_hstream -- --out gen --includeDir test-files --proto "${proto#test-files/}"
done
cabal build --enable-tests && cabal test
