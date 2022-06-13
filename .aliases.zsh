alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias sv='sudo -E nvim'
alias m='neomutt'
alias sql='sqlite3 -init ~/.config/sqlite3/sqliterc'
alias sc='sc-im'
alias copy='xclip -sel c'
alias diff='diff --color'
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

alias pacs='sudo pacman -S'
alias pacss='pacman -Ss'
alias pacqs='pacman -Qs'
alias pacsyu='sudo pacman -Syu'
alias pacrs='sudo pacman -Rs'
alias pacar='sudo pacman -Rsn $(pacman -Qdtq)'

alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit -v'
alias gcl='git clone --recurse-submodules'
alias gl='git pull'
alias gup='git pull --rebase'
alias gp='git push'
alias gf='git fetch'
alias gco='git checkout'
alias gst='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git diff --staged'
alias glg='git log --graph'
alias gr='git remote'
alias gra='git remote add'

alias t='tmux'
alias ta='tmux attach-session'
alias tl='tmux list-sessions'
alias tk='tmux kill-session'

# Compiles and executes C file and removes binary
# $1 path to the C file
crun() {
    gcc "$1" && ./a.out "${@:2}" && rm a.out
}

# Runs ranger and directs user to current ranger directory on quit
r() {
    local target=~/.cache/ranger/rangerdir
    ranger --choosedir=$target
    cd "$(cat $target)"
}
