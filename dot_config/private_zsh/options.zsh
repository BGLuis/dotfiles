# Histórico
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

# Comportamento
setopt autocd extendedglob
stty -ixon 2>/dev/null # Libera Ctrl+S e Ctrl+Q no terminal interativo

# Evita quebra de linha do RPROMPT no Starship e glitches de redimensionamento do cursor
export ZLE_RPROMPT_INDENT=0

# Autocompletar - Cores nos resultados
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Case-insensitive e completação parcial inteligente
# Ex: cd /doc -> /Documents | /u/s/a -> /usr/share/applications
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'