# ❄️ Dotfiles & Sistema Multi-OS (Arch Linux, macOS, Windows)

Gerenciamento unificado de configurações e provisionamento automatizado de pacotes pós-formatação para **Desktop** e **Notebook**, gerenciado via [chezmoi](https://www.chezmoi.io/).

---

## 🚀 Como restaurar após formatar

### 🐧 No Linux (Arch, Ubuntu, Debian) e 🍏 macOS
Abra o terminal e execute:
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply BGLuis
```

### 🪟 No Windows (PowerShell)
Abra o PowerShell como Administrador ou usuário comum:
```powershell
& {irm 'https://get.chezmoi.io/ps1' | iex} ; chezmoi init --apply BGLuis
```

---

## 📋 Menu Interativo de Seleção de Pacotes

Ao rodar a instalação em um computador recém-formatado com **Arch Linux**, o script apresentará um menu interativo no terminal:

```text
==========================================================================
 📦 Menu Interativo de Pacotes - Arch Linux
==========================================================================
 Selecione os pacotes que deseja instalar nesta máquina:

   [ 1] [✓] [Oficial] git
   [ 2] [✓] [Oficial] kitty
   [ 3] [✓] [Oficial] hyprland
   [ 4] [✓] [Oficial] quickshell
   [ 5] [✓] [AUR    ] vicinae-bin
   [ 6] [✓] [AUR    ] bitwarden
   [ 7] [✓] [AUR    ] spotify-launcher
   ...
==========================================================================
 [ENTER]          - Confirmar e instalar os pacotes marcados [✓]
 [números]        - Digite os números para marcar/desmarcar (ex: 6 7)
 [t]              - Inverter tudo (marcar todos / desmarcar todos)
 [e]              - Abrir lista no editor (nano) para apagar manualmente
 [p]              - Pular instalação de pacotes (continuar só com dotfiles)
==========================================================================
```

### O que você pode fazer no menu:
- **Pressionar ENTER**: Instala todos os pacotes recomendados imediatamente.
- **Digitar números (ex: `6 7`)**: Desmarca os itens escolhidos (ex: remove Bitwarden e Spotify).
- **Digitar `e`**: Abre a lista no `nano` para você apagar as linhas que não quiser instalar.
- **Digitar `p`**: Pula a instalação de pacotes por completo.

---

## 📦 Estrutura de Pacotes por Sistema Operacional

Os pacotes são gerenciados centralmente no arquivo [`.chezmoidata/packages.yaml`](.chezmoidata/packages.yaml):

| Sistema | Gerenciador | Pacotes Instalados |
|---|---|---|
| **Todos os Sistemas** | Nativo do SO | Git, Starship, Bitwarden, Tailscale, Spotify |
| **Linux (Geral)** | Apt / Pacman | Kitty, Nano |
| **Arch Linux** | Pacman + Yay (AUR) | Quickshell, Hyprland, Hypridle, Hyprlock, Vicinae, Btop, Lazygit, Grim/Slurp, Wayland tools |
| **macOS** | Homebrew | Git, Starship, Nano, Btop, Lazygit, Kitty, Bitwarden, Tailscale, Spotify |
| **Windows** | Winget | Git, Starship, Bitwarden, Tailscale, Spotify, Nano |

---

## 🖥️ Suporte Multi-Máquina (Desktop vs Notebook)

O chezmoi utiliza templates (`.tmpl`) para adaptar configurações de acordo com o tipo de computador:

| Configuração | Desktop | Notebook |
|---|---|---|
| **Monitores (`monitors.lua`)** | 3 telas (Odyssey G3 vertical, Super Frame 1440p, HDMI secundário) | Tela padrão `eDP-1` automática |
| **Touchpad (`input.lua`)** | Scroll e gestos desabilitados | `natural_scroll = true` e `workspace_swipe = true` |
| **Launcher / Menu** | Vicinae (`vicinae toggle` e `vicinae dmenu`) | Vicinae (`vicinae toggle` e `vicinae dmenu`) |
| **Pacotes extras (Arch)** | Pacotes padrão | `brightnessctl` (controle de brilho de tela) |
| **Quickshell** | Clona repositório oficial (se habilitado) | Clona repositório oficial (se habilitado) |

---

## 🛠️ Comandos Úteis no Dia a Dia

Os arquivos deste repositório estão localizados em:
- `~/Documents/hand-on/dotfiles` (linkado para `~/.local/share/chezmoi`)

| Comando | Descrição |
|---|---|
| `chezmoi status` | Mostra quais arquivos locais estão diferentes do repositório |
| `chezmoi diff` | Mostra o diff linha por linha das alterações |
| `chezmoi apply` | Aplica as configurações do repositório no seu sistema (`~`) |
| `chezmoi add ~/.config/<app>` | Adiciona uma nova pasta ou arquivo aos dotfiles |
| `chezmoi cd` | Entra diretamente na pasta dos dotfiles no terminal |

### Para enviar alterações para o GitHub:
```bash
cd ~/Documents/hand-on/dotfiles
git add .
git commit -m "feat: atualiza configuracao"
git push origin main
```
