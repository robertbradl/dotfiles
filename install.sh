#!/usr/bin/bash

# Installs xCode CLI Tools
echo "Installing CLI tools..."
xcode-select --install

# Install Homebrew
echo "Installing brew.."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Brew Section
#
## Taps
echo "Tapping brew.."
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

## Installs

brew install wget
brew install jq
brew install yq
brew install ripgrep
brew install lua
brew install luarocks
brew install neovim
brew install yabai
brew install sketchybar
brew install borders
brew install tmux
brew install chezmoi
brew install fzf
brew install z
brew install zoxide
brew install lazygit
brew install bat
brew install fish
brew install htop
brew install gnupg
brew install yazi
brew install ffmpeg
brew install sevenzip
brew install poppler
brew install fd
brew install resvg
brew install imagemagick
brew install font-symbols-only-nerd-font

## Casks

brew install --cask sf-symbols
brew install --cask font-sf-pro
brew install --cask font-sf-mono
brew install --cask font-geist-mono-nerd-font
brew install --cask wezterm

# Sketchybar App Font
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# SbarLua
(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)

# tmux tpm
mkdir ~/.config/tmux
mkdir ~/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
