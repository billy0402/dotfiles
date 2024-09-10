install_brew_packages() {
    brew install exiftool geckodriver tree
    brew install --cask ngrok
    brew update && brew upgrade && brew cleanup
}

main() {
    install_brew_packages
}

main
