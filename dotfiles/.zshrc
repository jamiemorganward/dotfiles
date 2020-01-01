ZSH_DISABLE_COMPFIX=true

# Oh My ZSH
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Pure prompt, disable theme
# https://github.com/sindresorhus/pure#oh-my-zsh
ZSH_THEME=""

# Plugins
plugins=(
  git
  zsh-syntax-highlighting
)

# fpath
fpath=( "$HOME/.zfunctions" $fpath )
fpath+=( "$HOME/.nvm/versions/node/v13.5.0/lib/node_modules/pure-prompt/functions" )

# Pure prompt
# https://github.com/sindresorhus/pure#getting-started
autoload -U promptinit; promptinit
prompt pure

# Automatically list directory contents on `cd`.
auto-ls () {
	emulate -L zsh;
	# explicit sexy ls'ing as aliases arent honored in here.
	hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
}
chpwd_functions=( auto-ls $chpwd_functions )

# Source non-zsh dotfiles
source ~/.bash_profile

# Better history
HISTORY_IGNORE="(exit|ls|bg|fg|history|clear)"
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.history

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
