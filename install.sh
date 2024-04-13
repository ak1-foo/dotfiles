#!/usr/bin/env bash

# stop script when error(-e) or undefined(-u)
set -eu

# cd to the dir which contains this file
BASEDIR=$(dirname $0)
cd $BASEDIR

# create_symlink function
create_symlink() {
    target_file="$1"
    link_name="$2"

    # create directory if it doesn't exist
    mkdir -p "$(dirname "$link_name")"

    # create symbolic link
    ln -snfv "$target_file" "$link_name"
}

create_symlink "$PWD/.bash_aliases" "$HOME/.bash_aliases"
create_symlink "$PWD/.bash_profile" "$HOME/.bash_profile"
create_symlink "$PWD/.bashrc" "$HOME/.bashrc"
create_symlink "$PWD/.bashrc.local" "$HOME/.bashrc.local"
create_symlink "$PWD/.editorconfig" "$HOME/.editorconfig"
create_symlink "$PWD/.gitconfig" "$HOME/.gitconfig"
create_symlink "$PWD/.inputrc" "$HOME/.inputrc"
create_symlink "$PWD/.profile" "$HOME/.profile"
create_symlink "$PWD/.vimrc" "$HOME/.vimrc"
create_symlink "$PWD/init.vim" "$HOME/.config/nvim/init.vim"
create_symlink "$PWD/.vscode/settings.json" "$HOME/.config/Code/User/settings.json"
create_symlink "$PWD/.vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"
