echo "Create libnode directory structure"
mkdir libnode
mkdir libnode/include
mkdir libnode/include/v8
mkdir libnode/include/uv

mkdir libnode/lib
mkdir libnode/bin
mkdir libnode/npm

# copy headers
echo "Copy headers..."
cp -r src/* libnode/include/
cp -r deps/v8/include/* libnode/include/v8
cp -r deps/uv/include/* libnode/include/uv

# remove source files
echo "Header files copied. Removing source files..."
find libnode/include -name "*.cc" -delete

# copy libs
echo "Copy libs..."
cp out/Release/libnode.lib libnode/lib/
cp out/Release/node.lib libnode/lib/

# copy binaries
echo "Copy binaries..."
cp out/Release/libnode.dll libnode/bin/
cp out/Release/libnode.pdb libnode/bin/
cp out/Release/node.exe libnode/bin/
cp out/Release/node.pdb libnode/bin/

# copy npm
echo "Copy npm..."
cp -r deps/npm/* libnode/npm/

echo "Packaging complete."
