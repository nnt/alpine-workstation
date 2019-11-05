#!/bin/bash
# NOTE: run as a non-privileged user, e.g. "vagrant"

sudo apk update
sudo apk add git nano htop iotop tmux

# zsh related, shadow for chsh command
sudo apk add shadow zsh

# pyenv related, https://github.com/pyenv/pyenv/wiki/Common-build-problems
sudo apk add --no-cache bzip2-dev coreutils dpkg-dev dpkg expat-dev \
  findutils gcc gdbm-dev libc-dev libffi-dev libnsl-dev libtirpc-dev \
  linux-headers make ncurses-dev openssl-dev pax-utils readline-dev \
  sqlite-dev tcl-dev tk tk-dev util-linux-dev xz-dev zlib-dev

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

# install pyenv
curl https://pyenv.run | bash
echo 'export PATH="/home/vagrant/.pyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
export PATH="/home/vagrant/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.8.0
pyenv global 3.8.0
