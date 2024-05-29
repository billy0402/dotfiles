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

setup_pipx() {
    if command -v pipx > /dev/null; then
        echo "Pipx already installed"
    else
        echo "Run setup-pipx.sh to install pipx"
    fi
}

install_pyenv() {
    if [ ! -d "$HOME/.pyenv" ]; then
        echo "Install pyenv"
        curl https://pyenv.run | bash
    else
        echo "Pyenv already exists"
    fi
}

install_nvm() {
    local nvm_dir

    nvm_dir="$HOME/.nvm"

    if [ ! -d "$nvm_dir" ]; then
        echo "Install nvm"
        git clone https://github.com/nvm-sh/nvm.git "$nvm_dir"
        cd "$nvm_dir"
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    else
        echo "Nvm already exists"
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
    setup_pipx
    echo
    install_pyenv
    echo
    install_nvm
}

main
