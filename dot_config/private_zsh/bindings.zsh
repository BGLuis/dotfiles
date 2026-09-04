bindkey -e
bindkey -r '\e\e'
bindkey '^S' sudo-command-line

# Corrige o Delete
bindkey '^[[3~' delete-char

# Corrige o Home (dependendo do terminal, envia códigos diferentes)
bindkey '^[[1~' beginning-of-line
bindkey '^[[H'  beginning-of-line
bindkey '^[OH'  beginning-of-line

# Corrige o End (dependendo do terminal, envia códigos diferentes)
bindkey '^[[4~' end-of-line
bindkey '^[[F'  end-of-line
bindkey '^[OF'  end-of-line

# Navegação e busca inteligente no histórico
bindkey '^[[1;5C' forward-word          # Ctrl+→ pula palavra
bindkey '^[[1;5D' backward-word         # Ctrl+← volta palavra
bindkey '^[[A' history-search-backward  # ↑ busca histórico pelo prefixo digitado
bindkey '^[[B' history-search-forward   # ↓ busca histórico pelo prefixo digitado
bindkey '^[[Z' reverse-menu-complete    # Shift+Tab volta no menu