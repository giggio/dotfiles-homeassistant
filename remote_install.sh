#!/usr/bin/env bash

# run with:
# curl -fsSL https://raw.githubusercontent.com/giggio/dotfiles-homeassistant/refs/heads/main/remote_install.sh | sudo -u giggio bash

set -euo pipefail
if [[ `id -u` == '0' ]]; then
  echo "Don't run this as root"
  exit 1
fi
data_dir=/data/giggio
if ! [ -d $data_dir ]; then
  echo "You need a $data_dir directory. Set it on the Home Assistant configuration, add a command to init_commands like: 'mkdir -p /data/giggio' and another as 'chown giggio:giggio /data/giggio'"
  exit 1
fi
if [ -d $HOME/.dotfiles ]; then
  echo "You already have a $HOME/.dotfiles directory"
  exit 1
fi
if [ -d $data_dir/.dotfiles ]; then
  echo "You already have a $data_dir/.dotfiles directory"
  exit 1
fi
# Using https instead of ssh because we are forwarding the ssh key and this is run by the Home Assistant add-on
git clone --recurse-submodules https://github.com/giggio/dotfiles-homeassistant.git $data_dir/.dotfiles/
ln -s $data_dir/.dotfiles/ $HOME/.dotfiles
$HOME/.dotfiles/install
cd $HOME/.dotfiles
git remote set-url origin git@github.com:giggio/dotfiles-homeassistant.git
git submodule sync

