ZSH=$HOME/.oh-my-zsh
export EDITOR=$(which vim)
export CC=/usr/local/bin/gcc-4.9

BASE16_SCHEME="ocean"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

unsetopt correct_all
unsetopt sharehistory

plugins=(git tmux brew node)

source $ZSH/oh-my-zsh.sh

__git_files () {
  _wanted files expl 'local files' _files
}

# Prompt
# adds the current branch name in green
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "%B%F{black}─ %f%{$reset_color%}%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%} "
  fi
}
# export PS1='$(git_prompt_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}]$ '
# export PROMPT='%B%F{black}──── %f'
export PS1='$(git_prompt_info)%B%F{black}──── %f'

# Source that fails silently
ssource() {
  source $1 2> /dev/null
}

ssource ~/.zshrc.local
ssource ~/.aliases
ssource ~/.aliases.local
