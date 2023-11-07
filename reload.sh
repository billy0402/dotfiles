install_python() {
    if command -v pyenv > /dev/null; then
        echo "Install python"
        pyenv install 3.11.5
        pyenv global 3.11.5
    fi
}

install_poetry() {
    if command -v poetry > /dev/null; then
        echo "Poetry already installed"
    else
        echo "Install poetry"
        curl -sSL https://install.python-poetry.org | python3 -
    fi
}

install_node() {
    if [ -d $NVM_DIR ]; then
        source $NVM_DIR/nvm.sh
        echo "Install node"
        nvm install --lts
    fi
}

install_ruby() {
    if command -v rvm > /dev/null; then
        echo "Install ruby"
        rvm install 3.2.2 --with-openssl-dir=$(brew --prefix openssl@3)
        # rvm --default use 3.2.2
    fi
}

install_cocoapods() {
    if command -v pod > /dev/null; then
        echo "CocoaPods already installed"
    else
        echo "Install cocoapods"
        sudo gem install cocoapods
    fi
}

install_fastlane() {
    if command -v fastlane > /dev/null; then
        echo "Fastlane already installed"
    else
        echo "Install fastlane"
        sudo gem install fastlane
    fi
}

setup_flutter() {
    flutter config --no-analytics
    flutter precache
}

main() {
    install_python
    echo
    install_poetry
    echo
    install_node
    echo
    install_ruby
    echo
    install_cocoapods
    echo
    install_fastlane
    echo
    setup_flutter
}

main
