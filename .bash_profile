PS1='\u \w > '
export PS1="$PS1\[\e]1337;CurrentDir="'$(pwd)\a\]'
export BASH_SILENCE_DEPRECATION_WARNING=1

alias python=python3
alias ls='ls --color=auto'
alias vim=nvim

export VISUAL=vim
export EDITOR="$VISUAL"

eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
export PATH="$PATH:/Users/robert/Library/Python/3.9/bin"

cleanzip() {
  zip -d "$@" "__MACOSX/*" "*.DS_Store"
}

echo "HELLO ROBERT"
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.4.1
