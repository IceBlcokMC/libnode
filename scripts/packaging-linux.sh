prefix="libnode"
prefix_with_plat="$prefix-linux-x64"

# Package contents
# 
# libnode-linux-x64-npm/
#   node/deps/npm/*
# 
# libnode-linux-x64-sdk/
#   include/
#     node/src/*
#     v8/
#       node/deps/v8/include/*
#     uv/
#       node/deps/uv/include/*
#   lib/
#     node/out/Release/lib/libnode.so.*
#     node/out/Release/node
# 
# libnode-linux-x64-bin/
#     node/out/Release/lib/libnode.so.*
#     node/out/Release/node


# Package npm
echo "[1/3] Packaging npm..."

npm_dir="$prefix_with_plat-npm"
echo "Create dir: $npm_dir"
mkdir "$npm_dir"

echo "Copy npm..."
cp -r node/deps/npm/* "$npm_dir"

ls -la "$npm_dir"

echo "[1/3] Packaging npm complete."

# Package SDK
echo "[2/3] Packaging SDK..."

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
cp node/out/Release/lib/libnode.so.* "$sdk_lib_dir"
cp node/out/Release/node "$sdk_lib_dir"

ls -la "$sdk_lib_dir"

echo "[2/3] Packaging SDK complete."

# Package binaries
echo "[3/3] Packaging binaries..."

bin_dir="$prefix_with_plat-bin"
echo "Create dir: $bin_dir"
mkdir "$bin_dir"

echo "Copy binaries..."
cp node/out/Release/lib/libnode.so.* "$bin_dir"
cp node/out/Release/node "$bin_dir"

echo "[3/3] Packaging binaries complete."
