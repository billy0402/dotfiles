echo zinit
time zsh -i -c exit
echo

echo CommandLineTools
xcode-select -p
echo

echo Hombrew
brew --version
brew leaves
brew list --cask
brew doctor
echo

echo pipx
pipx --version
echo

echo pyenv
pyenv --version
pyenv versions
python --version
pip list
echo

echo pipenv
pipenv --version
echo

echo poetry
poetry --version
echo

echo NVM
source $NVM_DIR/nvm.sh
nvm --version
nvm ls
node --version
npm ls -g --depth=0
echo

echo RVM
rvm --version
rvm list
ruby --version
echo

echo CocoaPods
pod --version
echo

echo fastlane
fastlane --version
echo

echo Flutter
flutter doctor
