# Zinit setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Vi mode only
zinit light jeffreytse/zsh-vi-mode

# Vi mode settings
ZVM_ESCAPE_KEYTIMEOUT=0.03
ZVM_CURSOR_STYLE_ENABLED=false
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
