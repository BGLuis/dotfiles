# Criar pastas necessárias antes de carregar o Znap
mkdir -p ~/.local/share/zsh-snap/completions
mkdir -p ~/.cache/zsh-snap

ZSH_PLUGINS="$HOME/.local/share/zsh-plugins"
source "$ZSH_PLUGINS/zsh-snap/znap.zsh"
ZSH=~[ohmyzsh/ohmyzsh]

znap eval starship 'starship init zsh --print-full-init'
znap eval zoxide 'zoxide init zsh'
znap prompt

# Plugins de funcionalidade
znap source Aloxaf/fzf-tab
znap source zsh-users/zsh-completions
znap source djui/alias-tips
znap source ohmyzsh/ohmyzsh plugins/bgnotify
znap source ohmyzsh/ohmyzsh plugins/sudo
znap source ohmyzsh/ohmyzsh plugins/catimg
znap source ohmyzsh/ohmyzsh plugins/docker-compose
znap source ohmyzsh/ohmyzsh lib/history.zsh
znap source ohmyzsh/ohmyzsh lib/key-bindings.zsh
znap source ohmyzsh/ohmyzsh lib/completion.zsh
znap source greymd/docker-zsh-completion

znap eval fzf 'fzf --zsh'

# Command-not-found (Arch Linux)
if [ -f /usr/share/doc/pkgfile/command-not-found.zsh ]; then
  source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# Plugins visuais
znap source zsh-users/zsh-autosuggestions
znap source zdharma-continuum/fast-syntax-highlighting