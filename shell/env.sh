PROMPT='%m %1~ $ '
eval "$(/opt/homebrew/bin/brew shellenv)"
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
eval "$(fzf --zsh)"
#Execute on startup
tmux attach #launch in tmux session (dev) with two windows (nvim, zsh)
clear #hide tmux nesting warning

#Show git branch on prompt line
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1)/p'
}

COLOR_DEF=$'%f'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='%m %1~ ${COLOR_GIT}%B$(parse_git_branch)%b${COLOR_DEF}$([ -n "$(parse_git_branch)" ] && echo " ")$ '
