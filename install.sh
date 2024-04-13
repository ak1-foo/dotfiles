#!/usr/bin/env bash

# stop script when error(-e) or undefined(-u)
set -eu

# cd to the dir which contains this file
cd "$(dirname "$0")"


# setting up the local files
create_local_file() {
    local_file="$1"
    # check if the local file exists
    if [ ! -e "$local_file" ]; then
        touch "$local_file"
    fi
}

create_local_file "$PWD/.bashrc.local"
create_local_file "$PWD/.bashrc.proxy"
create_local_file "$PWD/.gitconfig.local"


non_existent_files=()

# create_symlink function
create_symlink() {
    target_file="$1"
    link_name="$2"

    # check if the target file exists
    if [ ! -e "$target_file" ]; then
        non_existent_files+=("$target_file")
        return
    fi

    # create directory if it doesn't exist
    mkdir -p "$(dirname "$link_name")"

    # create symbolic link
    ln -snfv "$target_file" "$link_name"
}

create_symlink "$PWD/.bash_aliases" "$HOME/.bash_aliases"
create_symlink "$PWD/.bash_profile" "$HOME/.bash_profile"
create_symlink "$PWD/.bashrc" "$HOME/.bashrc"
create_symlink "$PWD/.bashrc.local" "$HOME/.bashrc.local"
create_symlink "$PWD/.bashrc.proxy" "$HOME/.bashrc.proxy"
create_symlink "$PWD/.editorconfig" "$HOME/.editorconfig"
create_symlink "$PWD/.gitconfig" "$HOME/.gitconfig"
create_symlink "$PWD/.gitconfig.local" "$HOME/.gitconfig.local"
create_symlink "$PWD/.inputrc" "$HOME/.inputrc"
create_symlink "$PWD/.profile" "$HOME/.profile"
create_symlink "$PWD/.vimrc" "$HOME/.vimrc"
create_symlink "$PWD/init.vim" "$HOME/.config/nvim/init.vim"
create_symlink "$PWD/.vscode/settings.json" "$HOME/.config/Code/User/settings.json"
create_symlink "$PWD/.vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"

# check if there are any non-existent files
if [ ${#non_existent_files[@]} -gt 0 ]; then
    echo ""
    echo "The following target files were not found and no symlinks were created:"
    printf "\e[31m %s \e[m\n" "${non_existent_files[@]}"
fi
