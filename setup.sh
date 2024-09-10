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

install_uv() {
    if command -v uv > /dev/null; then
        echo "UV already installed"
    else
        curl -LsSf https://astral.sh/uv/install.sh | sh
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
    install_uv
    echo
    install_nvm
    echo
    install_rvm
    echo
    install_flutter
}

main
