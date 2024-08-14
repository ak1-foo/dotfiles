# auto completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
chmod -R go-w '/opt/homebrew/share'
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# install git completion
if ! [ -f "$HOME"/.git-completion.bash ]; then
    echo "Downloading git-completion.bash..."
    curl -s -o $HOME/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
autoload -Uz compinit && compinit

# install git prompt
if ! [ -f "$HOME"/.git-prompt.sh ]; then
    echo "Downloading git-prompt.sh..."
    curl -s -o $HOME/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi
source "$HOME"/.git-prompt.sh

# prompt setting
setopt PROMPT_SUBST ;
PS1='%F{green}%n@%m%f: %F{blue}%~%f%F{cyan}$(__git_ps1)%f \$ '

# allow lowercase when completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# apply the git completion and prompt
alias g='git'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

