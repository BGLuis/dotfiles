# Wrapper seguro para o Claude Code (busca o PAT no keyring sob demanda, sem expor a subprocessos globais)
claude() {
  local token
  if (( $+commands[secret-tool] )); then
    token="$(secret-tool lookup service github type pat 2>/dev/null)"
  fi
  if [[ -n "$token" ]]; then
    GITHUB_PERSONAL_ACCESS_TOKEN="$token" command claude "$@"
  else
    command claude "$@"
  fi
}

# Conectar ADB ao Waydroid automaticamente
adb-waydroid() {
  echo "Buscando IP do Waydroid..."
  local WAYDROID_IP
  WAYDROID_IP=$(sudo waydroid shell ip -4 addr 2>/dev/null \
    | command grep "inet " | command grep -v "127\.0\.0\.1" | awk '{print $2}' | cut -d/ -f1)

  if [[ -z "$WAYDROID_IP" ]]; then
    echo "Erro: IP não encontrado. O Waydroid está rodando?"
    return 1
  else
    adb connect "$WAYDROID_IP:5555"
    echo "Sucesso! ADB conectado ao Waydroid ($WAYDROID_IP)."
  fi
}

# Criar diretório e entrar diretamente
mkcd() {
  [[ -z $1 ]] && { print -u2 "uso: mkcd <diretório>"; return 1 }
  mkdir -p -- "$@" && cd -- "${@[-1]}"
}

# Docker logs interativo via fzf
dl() {
  local c=${1:-$(docker ps --format '{{.Names}}' 2>/dev/null | fzf --no-preview --height 40%)}
  [[ -n $c ]] && docker logs -f "$c"
}

# Shell interativo em container via fzf
dsh() {
  local c=${1:-$(docker ps --format '{{.Names}}' 2>/dev/null | fzf --no-preview --height 40%)}
  [[ -n $c ]] && docker exec -it "$c" sh -c 'command -v bash >/dev/null && exec bash || exec sh'
}

# Escolher script do package.json via fzf
nrs() {
  [[ -f package.json ]] || { print -u2 "nrs: package.json não encontrado no diretório atual"; return 1 }
  local s
  s=$(jq -r '.scripts | keys[]' package.json 2>/dev/null | fzf --no-preview --height 40%)
  [[ -n $s ]] && npm run "$s"
}

# Extrair arquivos compactados de qualquer formato comum
extract() {
  [[ -f $1 ]] || { print -u2 "extract: '$1' não é um arquivo válido"; return 1 }
  case "$1" in
    *.tar.bz2|*.tbz2) tar xjf   -- "$1" ;;
    *.tar.gz|*.tgz)   tar xzf   -- "$1" ;;
    *.tar.xz)         tar xJf   -- "$1" ;;
    *.tar)            tar xf    -- "$1" ;;
    *.zip)            unzip     -- "$1" ;;
    *.rar)            unrar x   -- "$1" ;;
    *.7z)             7z x      -- "$1" ;;
    *.gz)             gunzip    -- "$1" ;;
    *.bz2)            bunzip2   -- "$1" ;;
    *) print -u2 "extract: formato desconhecido: $1"; return 1 ;;
  esac
}

# SSH para host da Tailscale via fzf
tssh() {
  local h
  h=$(tailscale status --json 2>/dev/null | jq -r '.Peer[].DNSName' 2>/dev/null | sed 's/\.$//' | fzf --no-preview --height 40%)
  [[ -n $h ]] && ssh "$h"
}
