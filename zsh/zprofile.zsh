export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PAGER="less -FX"
export PATH="$HOME/.local/bin:$PATH"

# optionally set DEFAULT_USER in ~/.zshrc to your regular username to hide the “user@hostname” info when you’re logged in as yourself on your local machine.
export DEFAULT_USER="$USER"

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# pip
export PIP_REQUIRE_VIRTUALENV=true

# uv
source "$HOME/.cargo/env"

# Poetry
export POETRY_VIRTUALENVS_IN_PROJECT=true

# nvm
export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# RVM
export PATH="$PATH:$HOME/.rvm/bin"

# Flutter
export PATH="$PATH:$HOME/.flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export CHROME_EXECUTABLE="/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge"

# React Native
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
export ANDROID_HOME="$HOME/Library/Android/sdk"

# OrbStack
if [ -f "$HOME/.orbstack/shell/init.zsh" ]; then
    source $HOME/.orbstack/shell/init.zsh 2>/dev/null || :
fi

# Load local Config
[ -f $HOME/.zprofile.local ] && source $HOME/.zprofile.local

# My Scripts
if [ -d "$HOME/.dotfiles/scripts" ]; then
    export PATH="$HOME/.dotfiles/scripts:$PATH"
fi
