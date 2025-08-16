if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    echo " - Welcome Robert!"
end

eval "$(/opt/homebrew/bin/brew shellenv)"

bind --preset \cC cancel-commandline

alias vim="nvim"
alias python="python3"
alias cat="bat"
alias z="zoxide"
alias ls="eza --icons=always"

set -gx VISUAL vim
set -gx EDITOR vim

zoxide init fish | source
rvm default
