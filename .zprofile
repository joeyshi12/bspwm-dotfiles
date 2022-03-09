export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export VISUAL=nvim
export EDITOR="$VISUAL"
export HISTSIZE=2000
export SAVEHIST=2000
export HISTFILE="$XDG_DATA_HOME/zhistory"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export SSB_HOME="$XDG_DATA_HOME/zoom"

if [ -d ~/.local/bin ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
