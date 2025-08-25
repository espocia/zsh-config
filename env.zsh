export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$HOME/.nvm"
export PNPM_HOME="/home/jj/.local/share/pnpm"
export PYENV_ROOT="$HOME/.pyenv"

export PATH="$HOME/.config/hypr:$PATH"

# activate vim motions
bindkey -v

# bind exist insert mode to jk
bindkey -M viins 'jk' vi-cmd-mode

function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne '\e[1 q'   # block cursor (normal mode)
  else
    echo -ne '\e[5 q'   # beam cursor (insert mode)
  fi
}
zle -N zle-keymap-select

# also set cursor when line editor starts
function zle-line-init {
  echo -ne '\e[5 q'
}
zle -N zle-line-init

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
