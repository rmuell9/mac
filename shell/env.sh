PROMPT='%m %1~ $ '
eval "$(/opt/homebrew/bin/brew shellenv)"
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
eval "$(fzf --zsh)"

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p'
}

COLOR_DEF=$'%f'
COLOR_GIT=$'%F{39}'
COLOR_PINK=$'%F{205}'
setopt PROMPT_SUBST
export PROMPT='%m %1~ $([ -n "$(parse_git_branch)" ] && echo "${COLOR_GIT}git:(${COLOR_PINK}%B$(parse_git_branch)%b${COLOR_GIT})${COLOR_DEF} ")$ '

tmux attach
clear
#CTRL-r for fzf CL history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
