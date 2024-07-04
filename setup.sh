#!/bin/sh

sudo apt update 

script_path=$(readlink -f "$0")
script_dir=$(dirname "$script_path")

### ZSH
sudo apt install -y curl zsh

# oh-my-zsh https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Using the $ZSH environment variable doesn't work because we're still inside /bin/sh

# personal theme
cp "${script_dir}/schooler.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/"

# .zshrc
cp "${script_dir}/.zshrc" "$HOME/.zshrc"

### Fonts
# clone powerline/fonts git repo
git clone https://github.com/powerline/fonts.git "$script_dir/fonts"

# run powerline install script
sh "$script_dir/fonts/install.sh"

# remove downloaded powerline repo
rm -rf "$script_dir/fonts"

### Node Version Manager
# https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

### Ruby Version Manager
# https://rvm.io/
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable

### Terraform Version Manager
git clone --depth=1 https://github.com/tfutils/tfenv.git $HOME/.tfenv

### Java Environment Manager
git clone https://github.com/jenv/jenv.git $HOME/.jenv
