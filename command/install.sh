#!/bin/bash -eu

readonly command_name=gistimnow
readonly compress_file_name=install.tar.gz
readonly github_code_base_url='https://raw.githubusercontent.com/YumaInaura/gistim/master/command/'"$compress_file_name"

# Create home dir
readonly command_home="$HOME"/"$command_name"
mkdir -p "$command_home"

readonly download_tmp_dir="$HOME"/."$command_name"_install
mkdir -p "$download_tmp_dir"
curl -o "$download_tmp_dir"/"$compress_file_name" "$github_code_base_url"/"$compress_file_name"?$(date +%s)

# Refresh libraries
cp "$download_tmp_dir"/"$compress_file_name" "$HOME"/"$command_name"/
pushd "$HOME"/"$command_name"/
  tar -xzf "$compress_file_name"
popd
rm -f "$HOME"/"$command_name"/"$compress_file_name"

# Link command to PATH
readonly command_path=/usr/local/bin/"$command_name"
rm -f "$command_path"
ln -s "$command_home"/bin/"$command_name" "$command_path"

rm -rf "$HOME"/."$command_name"_install # !PREVENT WRONG REMOVING! Not use variable like `rm -rf "download_tmp_dir"`

echo "installed"

eval "$command_name" --version

