
mkdir -pv ~/.vim/swaps
mkdir -pv ~/.vim/backups

cp home/.gitconfig ~/
cp home/.vimrc ~/

xcode-select --install

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

