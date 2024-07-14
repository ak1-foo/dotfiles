#!/usr/bin/env bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    if test -r ~/.dircolors; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

# install git completion
if ! [ -f "$HOME"/.git-completion.bash ]; then
    echo "Downloading git-completion.bash..."
    curl -s -o $HOME/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi
source "$HOME"/.git-completion.bash

# install git prompt
if ! [ -f "$HOME"/.git-prompt.sh ]; then
    echo "Downloading git-prompt.sh..."
    curl -s -o $HOME/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi
source "$HOME"/.git-prompt.sh

# apply the git completion and prompt
alias g='git'
__git_complete g __git_main
