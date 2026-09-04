export EDITOR=nano
export VISUAL="$EDITOR"
export SSH_AUTH_SOCK=/home/luis/.bitwarden-ssh-agent.sock

export PATH="/home/luis/.local/bin:$PATH"

# NPM
export PATH="$PATH:$HOME/.npm-global/bin"

# Flutter / Dart
export PATH="$PATH:$HOME/flutter/bin"

# Android SDK
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_NDK_ROOT="$ANDROID_HOME/ndk/28.2.13676358"
export ANDROID_NDK_HOME="$ANDROID_NDK_ROOT"
export RANLIB="$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ranlib"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Chrome / Waydroid
export CHROME_EXECUTABLE="/usr/bin/chromium"

# FZF Environment
export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza -1 --icons --color=always {}'"
