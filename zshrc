ZSH=$HOME/.oh-my-zsh

export EDITOR=$(which vim)

unsetopt correct_all
unsetopt sharehistory

source $ZSH/oh-my-zsh.sh

# Source that fails silently
ssource() {
  source $1 2> /dev/null
}

ssource ~/.zshrc.local
ssource ~/.aliases
ssource ~/.aliases.local

__git_files () {
  _wanted files expl 'local files' _files
}

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# adds the current branch name in green
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
  fi
}

# mkdir, cd into it
mkcd () {
  mkdir -p "$*"
  cd "$*"
}

# Prompt
export PS1='$(git_prompt_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] '
