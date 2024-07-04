#!/bin/sh

sudo apt update 

script_path=$(readlink -f "$0")
script_dir=$(dirname "$script_path")

### ZSH
sudo apt install -y curl zsh

# oh-my-zsh https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# create custom dir
mkdir -p "$HOME/.local/zsh/themes" "$HOME/.local/zsh/plugins"

# personal theme
cp "${script_dir}/schooler.zsh-theme" "$HOME/.local/zsh/themes/"

# .zshrc
cp "${script_dir}/.zshrc" "$HOME/.zshrc"

### Fonts
# clone powerline/fonts git repo
git clone https://github.com/powerline/fonts.git "$script_dir/fonts"

# run powerline install script
sh "$script_dir/fonts/install.sh"

# remove downloaded powerline repo
rm -rf "$script_dir/fonts"

