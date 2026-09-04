# ==========================================
# ALIASES BÁSICOS & FERRAMENTAS MODERNAS
# ==========================================
alias grep='grep --color=auto'
alias rgrep='rg'

# LSD (visualização rápida com ícones)
alias ls='lsd'
alias la='lsd -a'
alias lt='lsd --tree'

# EZA (visualização detalhada com status do Git)
alias l='eza -lh --icons --git'
alias lla='eza -lah --icons --git'
alias ls-eza='eza --icons --git'
alias ls-lsd='lsd'

# Ferramentas Modernas
alias lg='lazygit'
alias top='btop'

# ==========================================
# DOCKER & DOCKER COMPOSE
# ==========================================
alias dc='docker compose'
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'
alias dps='docker ps'
alias dpsa='docker ps -a'

# ==========================================
# GIT
# ==========================================
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate -20'

# ==========================================
# NPM
# ==========================================
alias n='npm'
alias nr='npm run'
alias ni='npm install'
alias nrd='npm run dev'

# ==========================================
# NAVEGAÇÃO & UTILITÁRIOS
# ==========================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

alias zshrc='$EDITOR $ZDOTDIR/.zshrc'
alias zshreload='exec zsh'

alias df='df -h'
alias free='free -h'
alias ports='ss -tulpn'
alias myip='curl -s ifconfig.me'

# ==========================================
# REDE
# ==========================================
alias ts='tailscale'
alias tss='tailscale status'
alias p='ping -c 5'