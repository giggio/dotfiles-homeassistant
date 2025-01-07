#!/usr/bin/env bash

# run with:
# curl -fsSL https://raw.githubusercontent.com/giggio/dotfiles-homeassistant/refs/heads/main/remote_install.sh | sudo -u giggio bash

set -euo pipefail
if [[ `id -u` == '0' ]]; then
  echo "Don't run this as root"
  exit 1
fi
if readlink $HOME/.config &> /dev/null; then
  echo "$HOME/.config is already symlinked"
else
  ln -s /data/giggio/.config/ $HOME/.config
fi
if [ -d $HOME/.dotfiles ]; then
  echo "You already have a $HOME/.dotfiles directory"
  exit 1
else
  # Using https instead of ssh because we are forwarding the ssh key and this is run by the Home Assistant add-on
  git clone --recurse-submodules https://github.com/giggio/dotfiles-homeassistant.git $HOME/.dotfiles
  $HOME/.dotfiles/install
  cd $HOME/.dotfiles
  git remote set-url origin git@github.com:giggio/dotfiles-homeassistant.git
  git submodule sync
fi
