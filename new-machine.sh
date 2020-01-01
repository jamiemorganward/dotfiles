## Add uncommitted stuff here
touch $HOME/.extra

./install/xcode-select.sh
./install/homebrew.sh

./brew/brew.sh
./brew/brew-cask.sh

./install/node.sh

./setup/zsh.sh

# github.com/thebitguru/play-button-itunes-patch
# disable itunes opening on media keys
git clone https://github.com/thebitguru/play-button-itunes-patch ~/code/play-button-itunes-patch
