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

# pipx
export PIPX_HOME="$HOME/.pipx"
export PIPX_BIN_DIR="$PIPX_HOME/bin"
export PATH="$PIPX_BIN_DIR:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d $PYENV_ROOT ]; then
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# pipenv
if command -v pipenv 1>/dev/null 2>&1; then
    # eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"
    export PIPENV_VENV_IN_PROJECT=true
fi

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

# OrbStack
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
