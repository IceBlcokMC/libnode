# libnode-npm/
#   node/deps/npm/*

prefix="libnode"

echo "[1/1] Packaging npm..."

npm_dir="$prefix-npm"
echo "Create dir: $npm_dir"
mkdir "$npm_dir"

echo "Copy npm..."
cp -r node/deps/npm/* "$npm_dir"

ls -la "$npm_dir"

echo "[1/1] Packaging npm complete."
