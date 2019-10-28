#!/bin/bash
# NOTE: run as a non-privileged user, e.g. "vagrant"

sudo apk update
sudo apk add git nano htop iotop shadow zsh
# shadow is for chsh command

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# use oh-my-zsh theme agnoster
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# change default shell to zsh
echo "vagrant" | chsh -s $(which zsh)