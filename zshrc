ZSH=$HOME/.oh-my-zsh

unsetopt correct_all
unsetopt sharehistory

plugins=(git tmux brew node)

source $ZSH/oh-my-zsh.sh

if [[ -e ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

if [[ -e ~/.aliases ]]; then
  source ~/.aliases
fi

__git_files () {
  _wanted files expl 'local files' _files
}

. `brew --prefix`/etc/profile.d/z.sh

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
