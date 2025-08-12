echo "Packing libnode..."
base_name="libnode-win-x64"


# 打包产物
bin_dir="$base_name-bin"
echo "Create dir: $bin_dir"
mkdir "$bin_dir"

echo "Copy binaries..."
cp out/Release/libnode.dll $bin_dir
cp out/Release/libnode.pdb $bin_dir
cp out/Release/node.exe $bin_dir
cp out/Release/node.pdb $bin_dir


# 打包开发头和库
sdk_dir="$base_name-sdk"
sdk_include_dir="$sdk_dir/include"
sdk_lib_dir="$sdk_dir/lib"
echo "Create dir: $sdk_dir"
echo "Create dir: $sdk_include_dir"
echo "Create dir: $sdk_lib_dir"
mkdir $sdk_dir
mkdir $sdk_include_dir
mkdir $sdk_lib_dir

# 依赖库
sdk_include_v8_dir="$sdk_include_dir/v8"
sdk_include_uv_dir="$sdk_include_dir/uv"
mkdir $sdk_include_v8_dir
mkdir $sdk_include_uv_dir

echo "Copy headers..."
cp -r src/* $sdk_include_dir
cp -r deps/v8/include/* $sdk_include_v8_dir
cp -r deps/uv/include/* $sdk_include_uv_dir

echo "Header files copied. Removing source files..."
find $sdk_include_dir -name "*.cc" -delete

echo "Copy libs..."
cp out/Release/libnode.lib $sdk_lib_dir
cp out/Release/node.lib $sdk_lib_dir


# 打包 npm
npm_dir="$base_name-npm"
mkdir $npm_dir

echo "Copy npm..."
cp -r deps/npm/* $npm_dir


echo "Packaging complete."
