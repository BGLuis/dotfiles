# Este arquivo é carregado APÓS os plugins, garantindo que 'compdef' e 'fzf-tab' existam.

# ==========================================
# FZF-TAB PREVIEW
# ==========================================
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color=always $realpath'
zstyle ':fzf-tab:complete:*:*' fzf-preview \
  '[[ -d $realpath ]] && eza -1 --icons --color=always $realpath || bat --color=always --style=numbers --line-range=:500 $realpath 2>/dev/null'
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'

# ==========================================
# ANGULAR CLI COMPLETION (com cache em disco)
# ==========================================
if (( $+commands[ng] )); then
  local ng_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/ng-completion.zsh"
  if [[ ! -s $ng_cache || $commands[ng] -nt $ng_cache ]]; then
    mkdir -p ${ng_cache:h}
    ng completion script > $ng_cache 2>/dev/null
  fi
  [[ -s $ng_cache ]] && source $ng_cache
fi