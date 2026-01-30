# libnode - Build a Node.js shared library

## Complile arguments

### Windows

```
./vcbuild.bat dll x64 release vs2022
```

### Linux(Ubuntu 24)

```
export CC=clang
export CXX=clang++
export CXXFLAGS="-stdlib=libc++"
export LDFLAGS="-stdlib=libc++"
./configure --ninja --shared
make -j$(nproc)
```
