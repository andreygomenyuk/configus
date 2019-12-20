
set -x

mkdir -pv ~/.vim/swaps
mkdir -pv ~/.vim/backups

cp home/.gitconfig ~/
cp home/.vimrc ~/

xcode-select --install

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install google-chrome
brew cask install 1password
brew cask install skype
brew cask install dropbox
brew cask install docker
brew cask install telegram
brew cask install phpstorm
brew cask install vlc
brew install composer

