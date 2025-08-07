eval "$(/opt/homebrew/bin/brew shellenv)"
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
eval "$(fzf --zsh)"

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p'
}

COLOR_DEF=$'%f'
COLOR_GIT=$'%F{75}'
COLOR_PINK=$'%F{210}'
setopt PROMPT_SUBST
export PROMPT='%B%1~%b $([ -n "$(parse_git_branch)" ] && echo "${COLOR_GIT}git:(${COLOR_PINK}%B$(parse_git_branch)%b${COLOR_GIT})${COLOR_DEF} ")'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
bindkey -v
