set -e

check() {
    echo "Checked"
    command -v git > /dev/null || { echo "Git not installed"; exit 1; }
}

setup_dotfiles() {
    echo "Setup dotfiles"
    if [ ! -d "$HOME/.dotfiles" ]; then
        git clone https://github.com/billy0402/dotfiles.git $HOME/.dotfiles
    fi
}

setup_git() {
    echo "Setup git"
    ln -svf $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig

    if [ ! -f "$HOME/.gitconfig.user" ]; then
        cp -v $HOME/.dotfiles/git/gitconfig.user $HOME/.gitconfig.user
    fi
}

setup_zsh() {
    echo "Setup zsh"
    ln -svf $HOME/.dotfiles/zsh/zshrc.zsh $HOME/.zshrc
    ln -svf $HOME/.dotfiles/zsh/zprofile.zsh $HOME/.zprofile

    if [ ! -f "$HOME/.zprofile.local" ]; then
        cp -v $HOME/.dotfiles/zsh/zprofile.local.zsh $HOME/.zprofile.local
    fi
}

setup_vim() {
    echo "Setup vim"
    if [ ! -f "$HOME/.vimrc" ]; then
        ln -svf $HOME/.dotfiles/vim/vimrc $HOME/.vimrc
    else
        echo "Skip vim setup because config file already found"
    fi
}

setup_vscode() {
    echo "Setup vscode"
    if [ ! -f "$HOME/Library/Application Support/Code/User/settings.json" ]; then
        ln -s $HOME/.dotfiles/.vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
    else
        echo "Skip vscode setup because config file already found"
    fi
}

load_homebrew() {
    export PATH="$PATH:/opt/homebrew/bin"
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_NO_AUTO_UPDATE=1
}

install_pipx() {
    if command -v pipx > /dev/null; then
        echo "Pipx already installed"
    else
        echo "Install pipx"
        brew install pipx
    fi
}

install_pyenv() {
    if command -v pyenv > /dev/null; then
        echo "Pyenv already installed"
    else
        echo "Install pyenv"
        curl https://pyenv.run | bash
    fi
}

install_pipenv() {
    if command -v pipenv > /dev/null; then
        echo "Pipenv already installed"
    else
        echo "Install pipenv"
        brew install pipenv
    fi
}

install_nvm() {
    if command -v nvm > /dev/null; then
        echo "NVM already installed"
    else
        echo "Install NVM"
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    fi
}

install_rvm() {
    if command -v rvm > /dev/null; then
        echo "RVM already installed"
    else
        echo "Install rvm"
        \curl -sSL https://get.rvm.io | bash -s stable
    fi
}

install_flutter() {
    if command -v flutter > /dev/null; then
        echo "Flutter already installed"
    else
        echo "Install flutter"
        git clone https://github.com/flutter/flutter.git -b stable $HOME/.flutter
    fi
}

install_brew_packages() {
    brew install exiftool geckodriver tree
    brew install --cask ngrok
    brew update && brew upgrade && brew cleanup
}

main() {
    check
    echo
    setup_dotfiles
    echo
    setup_git
    echo
    setup_zsh
    echo
    setup_vim
    echo
    setup_vscode
    echo
    load_homebrew
    echo
    install_pipx
    echo
    install_pyenv
    echo
    install_pipenv
    echo
    install_nvm
    echo
    install_rvm
    echo
    install_flutter
    echo
    install_brew_packages
}

main
