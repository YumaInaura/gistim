#!/bin/bash -eu

readonly command_name=gistimnow
readonly compress_file_name=install.gz
readonly github_code_base_url='https://raw.githubusercontent.com/YumaInaura/gistim/master/command/'"$compress_file_name"

# Create home dir
readonly command_home="$HOME"/"$command_name"
mkdir -p "$command_home"

readonly download_tmp_dir="$HOME"/.download
curl -o "$download_tmp_dir"/install.gz "$github_code_base_url"/"$compress_file_name"?$(date +%s)

# Refresh libraries
cp "$download_tmp_dir"/install.gz "$HOME"/"$command_name"/
pushd "$HOME"/"$command_name"/
  tar -xzf "$compress_file_name"
popd
rm "$HOME"/"$command_name"/install.gz

# Link command to PATH
readonly command_path=/usr/local/bin/"$command_name"
rm -f "$command_path"
ln -s "$command_home"/bin/"$command_name" "$command_path"

rm -rf "$HOME"/.download_"$command_name" # Not write as `rm -rf "download_tmp_dir"`

echo "installed"

gistimnow --version

