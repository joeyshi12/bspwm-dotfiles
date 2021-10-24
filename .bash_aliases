alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='vim'
alias sv='sudo -E vim'
alias r='ranger'
alias copy='xclip -sel c'

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

