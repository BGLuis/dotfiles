# ❄️ Dotfiles & Sistema (Arch Linux + Hyprland + Quickshell)

Gerenciamento de configurações e automação pós-formatação para **Desktop** e **Notebook**, gerenciado via [chezmoi](https://www.chezmoi.io/).

---

## 🚀 Como restaurar após formatar (Instalação em 1 comando)

Após instalar o Arch Linux em um novo PC ou notebook, abra o terminal e execute:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply BGLuis
```

### O que esse comando faz automaticamente:
1. **Detecta o hardware**: Pergunta se a máquina é um `desktop` ou `laptop`.
2. **Instala os pacotes**: Executa `run_onchange_install-packages.sh` para instalar Hyprland, Kitty, Quickshell, Zsh, Starship, fontes e utilitários via `pacman` (e compila o `yay` se necessário).
3. **Clona o Quickshell**: Baixa o repositório do Quickshell ([BGLuis/quickshell](https://github.com/BGLuis/quickshell)) direto em `~/.config/quickshell`.
4. **Aplica as configurações**:
   - **Hyprland**: Configura os 3 monitores no Desktop ou a tela `eDP-1` com gestos de swipe no Notebook.
   - **Terminal & Shell**: Kitty, Starship e Zsh (com aliases, bindings e plugins configurados).
   - **Utilitários**: Wofi, Btop e Lazygit.

---

## 🖥️ Suporte Multi-Máquina (Desktop vs Notebook)

O chezmoi utiliza templates (`.tmpl`) para ajustar as configurações conforme o tipo de computador:

| Configuração | Desktop | Notebook |
|---|---|---|
| **Monitores (`monitors.lua`)** | 3 telas (Odyssey G3 vertical, Super Frame 1440p, HDMI secundário) | Tela padrão `eDP-1` automática |
| **Touchpad (`input.lua`)** | Scroll e swipe desabilitados | `natural_scroll = true` e `workspace_swipe = true` |
| **Quickshell** | Clona repositório oficial | Clona repositório oficial |

Caso precise alterar o tipo de máquina em um sistema já configurado:
```bash
chezmoi init --promptChoice "chassisType=laptop"
chezmoi apply
```

---

## 🛠️ Comandos Úteis no Dia a Dia

Os arquivos deste repositório estão localizados em:
- Pasta de trabalho: `~/Documents/hand-on/dotfiles` (linkada em `~/.local/share/chezmoi`)

| Comando | Descrição |
|---|---|
| `chezmoi status` | Mostra quais arquivos locais estão diferentes do repositório |
| `chezmoi diff` | Mostra o diff linha por linha das alterações |
| `chezmoi apply` | Aplica as configurações do repositório no seu sistema (`~`) |
| `chezmoi add ~/.config/<app>` | Adiciona uma nova pasta/arquivo de configuração aos dotfiles |
| `chezmoi cd` | Entra diretamente na pasta dos dotfiles no terminal |

### Para enviar alterações para o GitHub:
```bash
cd ~/Documents/hand-on/dotfiles
git add .
git commit -m "feat: atualiza configuracao do hyprland"
git push origin main
```
