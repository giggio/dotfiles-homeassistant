#!/usr/bin/env bash

# run with:
# curl -fsSL https://raw.githubusercontent.com/giggio/dotfiles-homeassistant/refs/heads/main/remote_install.sh | sudo -u giggio bash

set -euo pipefail
if [[ `id -u` == '0' ]]; then
  echo "Don't run this as root"
  exit 1
fi
if [ -d $HOME/.dotfiles ]; then
  echo "You already have a $HOME/.dotfiles directory"
  exit 1
else
  git clone --recurse-submodules git@github.com:giggio/dotfiles-homeassistant.git $HOME/.dotfiles
  $HOME/.dotfiles/install
fi
