#!/bin/bash -eu

readonly command_name=gistimnow
readonly compress_file_name=install.tar.gz
readonly compress_file_url=https://raw.githubusercontent.com/YumaInaura/gistim/master/command/"$compress_file_name"
readonly command_home="$HOME"/"$command_name"
readonly download_tmp_dir="$HOME"/."$command_name"_install

function remove_tmp {
  # !PREVENT WRONG REMOVING! Not use variable like `rm -rf "download_tmp_dir"`
  rm -f "$HOME"/"$command_name"/"$compress_file_name"
  rm -rf "$HOME"/."$command_name"_install 
}
trap remove_tmp EXIT

readonly download_header=$(curl --head "$compress_file_url"?$(date +%s))
readonly download_ok=$(echo "$download_header" | grep 'OK')
[[ -z "$download_ok" ]] && echo "Download file not found" && echo "$compress_file_url" && echo "$download_header" && exit 1

# Create home dir
mkdir -p "$command_home"
mkdir -p "$download_tmp_dir"
curl -o "$download_tmp_dir"/"$compress_file_name" "$compress_file_url"?$(date +%s)

# Refresh libraries
cp "$download_tmp_dir"/"$compress_file_name" "$HOME"/"$command_name"/
pushd "$command_home"/
  tar -xzf "$compress_file_name"
popd

# Link command to PATH
readonly command_path=/usr/local/bin/"$command_name"
rm -f "$command_path"
ln -s "$command_home"/command/"$command_name" "$command_path"

echo "installed"

eval "$command_name" --version

