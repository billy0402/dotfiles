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

install_zsh() {
    if command zsh --version > /dev/null; then
        echo "zsh already installed"
    else
        sudo apt install zsh
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
    if [ ! -f "$HOME/.config/Code/User/settings.json" ]; then
        ln -s $HOME/.dotfiles/.vscode/settings.json "$HOME/.config/Code/User/settings.json"
    else
        echo "Skip vscode setup because config file already found"
    fi

    if [ ! -f "$HOME/.vscode-server/data/Machine/settings.json" ]; then
        ln -s $HOME/.dotfiles/.vscode/settings.json "$HOME/.vscode-server/data/Machine/settings.json"
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

main() {
    check
    echo
    setup_dotfiles
    echo
    setup_git
    echo
    install_zsh
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
}

main
