alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='vim'
alias sv='sudo -E vim'
alias r='ranger'
alias copy='xclip -sel c'

alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gp='git push'
alias gf='git fetch'
alias gup='git pull --rebase'
alias gcb='git checkout -b'
alias gst='git status'
alias gd='git diff'

alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t'

# Zips given directory into a tar file
# $1 path to the directory
tarzip() {
    if [ -d "$1" ]; then
        file_name="$(basename $1).tar.gz"
        tar -czvf $file_name $1 
    else
        echo Error: cannot find directory at $1
    fi
}

