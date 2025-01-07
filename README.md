# Giovanni Bassi's Dotfiles for Home Assistant

These are the dotfiles I use in Home Assistant. I'm using
[Dotbot](https://github.com/anishathalye/dotbot)
to automate it.

## Installation

*Note:* Some files and directories from the home directory will be removed. Check the
[install.conf.yaml](https://github.com/giggio/dotfiles/blob/master/install.conf.yaml)
file, on the `shell` section to see which ones and make sure you are ok with it,
there will be no prompt.

* Clone this repo to ~/.dotfiles

If you are the repo owner make sure the SSH keys are correct, as some submodules
use SSH, and clone with SSH.

Add this to the Home Assistant startup script:

````bash
curl -fsSL https://raw.githubusercontent.com/giggio/dotfiles-homeassistant/refs/heads/main/remote_install.sh | sudo -u giggio bash
````

Or, manually (this will be overwriten when the Home Assistant container is rebuilt):

````bash
git clone --recurse-submodules git@github.com:giggio/dotfiles.git $HOME/.dotfiles
````

If you are not the repo owner then you need to use https:

````bash
git clone --recurse-submodules https://github.com/giggio/dotfiles $HOME/.dotfiles
````

* Run the install script `~/.dotfiles/install`.

(to update run `~/.dotfiles/install --update`)

## Packages

These packages are necessary in Home Assistant config:

* delta
* gpg
* gpgconf
* bat
* nodejs
* npm
* eza
* zoxide
* starship
* fzf

And I also use (not necessary for this repo):

* kitty-terminfo

## Cleaning up before installing

Remove all directories that will be replaced by the submodules.

## Forking

You will need to take into consideration that this project uses submodules by
the same author, so you will need to fork those repositories first.
To learn which repositories are being used open at the [.gitmodules]() files and
look for relative submodules (that start with `..`).

## Author

[Giovanni Bassi](https://links.giggio.net/bio)

## License

Licensed under the Apache License, Version 2.0.
