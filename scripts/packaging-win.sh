prefix="libnode"
prefix_with_plat="$prefix-win-x64"

# Package contents
# 
# libnode-win-x64-sdk/
#   include/
#     node/src/*
#     v8/
#       node/deps/v8/include/*
#     uv/
#       node/deps/uv/include/*
#   lib/
#     node/out/Release/libnode.lib
#     node/out/Release/node.lib
# 
# libnode-win-x64-bin/
#   node/out/Release/node.exe
#   node/out/Release/libnode.dll
# 
# libnode-win-x64-pdb/
#   node/out/Release/node.pdb
#   node/out/Release/libnode.pdb

# Package SDK
echo "[1/3] Packaging SDK..."

sdk_dir="$prefix_with_plat-sdk"

sdk_include_dir="$sdk_dir/include"
sdk_lib_dir="$sdk_dir/lib"
echo "Create dir: $sdk_dir"
echo "Create dir: $sdk_include_dir"
echo "Create dir: $sdk_lib_dir"
mkdir -p "$sdk_dir" "$sdk_include_dir" "$sdk_lib_dir"

sdk_include_v8_dir="$sdk_include_dir/v8"
sdk_include_uv_dir="$sdk_include_dir/uv"
mkdir -p "$sdk_include_v8_dir" "$sdk_include_uv_dir"

echo "Copy headers..."
cp -r node/src/* "$sdk_include_dir"
cp -r node/deps/v8/include/* "$sdk_include_v8_dir"
cp -r node/deps/uv/include/* "$sdk_include_uv_dir"

echo "Header files copied. Removing source files..."
find "$sdk_include_dir" -name "*.cc" -delete

ls -la "$sdk_include_dir"

echo "Copy libs..."
cp node/out/Release/libnode.lib "$sdk_lib_dir"
cp node/out/Release/node.lib "$sdk_lib_dir"

ls -la "$sdk_lib_dir"

echo "[1/3] Packaging SDK complete."

# Package binaries
echo "[2/3] Packaging binaries..."

bin_dir="$prefix_with_plat-bin"
echo "Create dir: $bin_dir"
mkdir "$bin_dir"

echo "Copy binaries..."
cp node/out/Release/node.exe "$bin_dir"
cp node/out/Release/libnode.dll "$bin_dir"

echo "[2/3] Packaging binaries complete."

# Package debug symbols
echo "[3/3] Packaging debug symbols..."

pdb_dir="$prefix_with_plat-pdb"
echo "Create dir: $pdb_dir"
mkdir "$pdb_dir"

echo "Copy debug symbols..."
cp node/out/Release/node.pdb "$pdb_dir"
cp node/out/Release/libnode.pdb "$pdb_dir"

echo "[3/3] Packaging debug symbols complete."
echo "Packaging complete."