#!/usr/bin/env bash

# stop script when error(-e) or undefined(-u)
set -eu

# cd to the dir which contains this file
BASEDIR=$(dirname $0)
cd $BASEDIR

# exclusion file, dir list
excludelist=(
    ".git"
    ".gitignore"
)

exflag=false
# in dotfiles dir, search file whose name start with .
for file in .??*; do
    exflag=false
    # exclude file check
    for exfile in ${excludelist[@]}; do
        if [[ $file == $exfile ]]; then
            exflag=true
            continue
        fi
    done

    if [[ $exflag == false ]]; then
        # make symbolic link, overwrite if already exists
        ln -snfv ${PWD}/"$file" $HOME/"$file"
    fi
done

# install neovim (nvim) setting
nvim_config_path="$HOME/.config/nvim"
# if there is no nvim config dir, make it
if [ ! -d "$nvim_config_path" ]; then
    mkdir -p "$nvim_config_path"
fi
ln -snfv ${PWD}/init.vim $HOME/.config/nvim/init.vim

# install vscode setting
vscode_config_path="$HOME/.config/Code/User"
# if there is no vscode config dir, make it
if [ ! -d "$vscode_config_path" ]; then
    mkdir -p "$vscode_config_path"
fi
ln -snfv "${PWD}"/.vscode/settings.json "$vscode_config_path"/settings.json
ln -snfv "${PWD}"/.vscode/keybindings.json "$vscode_config_path"/keybindings.json
