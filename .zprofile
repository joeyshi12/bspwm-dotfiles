export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

export VISUAL="nvim"
export EDITOR="${VISUAL}"

export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE="${XDG_DATA_HOME}/zsh_history"

export NVM_DIR="${XDG_DATA_HOME}/nvm"
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node_repl_history"
export SQLITE_HISTORY="${XDG_DATA_HOME}/sqlite_history"
export SSB_HOME="${XDG_DATA_HOME}/zoom"
export WINEPREFIX="${XDG_DATA_HOME}/wineprefixes/default"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter"

if [ -d ~/.local/bin ]; then
    PATH="${HOME}/.local/bin:${PATH}"
fi
