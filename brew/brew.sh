#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## Add homebrew to PATH for this script
export PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH

brew_install() {

    declare -r CMD="$3"
    declare -r CMD_ARGUMENTS="$4"
    declare -r FORMULA="$2"
    declare -r FORMULA_READABLE_NAME="$1"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `Homebrew` is installed.

    if ! cmd_exists "brew"; then
        print_error "$FORMULA_READABLE_NAME ('Homebrew' is not installed)"
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install the specified formula.

    # shellcheck disable=SC2086
    if brew $CMD list "$FORMULA" &> /dev/null; then
        print_success "$FORMULA_READABLE_NAME"
    else
        execute \
            "brew $CMD install $FORMULA $CMD_ARGUMENTS" \
            "$FORMULA_READABLE_NAME"
    fi

}

# Install command-line tools using Homebrew

# GNU core utilities (those that come with OS X are outdated)
brew_install "coreutils" "coreutils"

# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
brew_install "findutils" "findutils"

# GNU `sed`
brew_install "GNU-sed" "gnu-sed"

# Install wget with IRI support
brew_install "wget" "wget"

# Install more recent versions of some OS X tools
brew_install "VIM" "vim"
brew_install "Nano" "nano"
brew_install "Grep" "grep"
brew_install "OpenSSH" "openssh"

# Other binaries
brew_install "Git" "git"
brew_install "aria2" "aria2"
brew_install "composer" "composer"
brew_install "doctl" "doctl"
brew_install "mas" "mas"
brew_install "mkvtoolnix" "mkvtoolnix"
brew_install "yarn" "yarn"
brew_install "ffmpeg" "ffmpeg"
brew_install "zsh" "zsh"
brew_install "zsh-syntax-highlighting" "zsh-syntax-highlighting"

# Remove outdated versions from the cellar
brew cleanup
