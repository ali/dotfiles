# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# expand functions in the prompt
setopt prompt_subst

#aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

#functions
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set 256 Colors
export TERM='xterm-256color'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github osx rails ruby brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"

# mkdir, cd into it
mkcd () {
  mkdir -p "$*"
  cd "$*"
}
