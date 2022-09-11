alias \
    ls="ls --color=auto" \
    grep="grep --color=auto" \
    v="$EDITOR" \
    sv="sudo -E $EDITOR" \
    m="neomutt" \
    sc="sc-im" \
    copy="xclip -sel c" \
    diff="diff --color" \
    ssh="kitty +kitten ssh"  # kitty ssh patch

# pacman abbreviations
alias \
    p="pacman" \
    pacs="sudo pacman -S" \
    pacss="pacman -Ss" \
    pacqs="pacman -Qs" \
    pacsyu="sudo pacman -Syu" \
    pacrs="sudo pacman -Rs" \
    pacsc="sudo pacman -Sc"

pacar() {
    orphan_packages="$(pacman -Qdtq)"
    if [ -z "$orphan_packages" ]; then
        echo "error: no orphan packages found"
    else
        sudo pacman -Rsn "$(orphan_packages)"
    fi
}

# git abbreviations
alias \
    g="git" \
    ga="git add" \
    gaa="git add --all" \
    grm="git rm --cached" \
    gb="git branch" \
    gc="git commit -vm" \
    gca="git commit -vam" \
    gcl="git clone --recurse-submodules" \
    gl="git pull" \
    gl="git pull --rebase" \
    gm="git merge" \
    gp="git push" \
    gf="git fetch" \
    gco="git checkout" \
    gst="git status" \
    gd="git diff" \
    gdc="git diff --cached" \
    glg="git log --graph" \
    gr="git remote"

# tmux abbreviations
alias \
    t="tmux" \
    ta="tmux attach-session" \
    tl="tmux list-sessions" \
    tk="tmux kill-session"

# Compiles and executes C file and removes binary
# $1 path to the C file
crun() {
    gcc "$1" && ./a.out "${@:2}" && rm a.out
}

# Runs lf and directs user to current lf directory on quit
lf() {
    local target=~/.cache/lf/lfdir
    /usr/bin/lf -last-dir-path $target
    cd "$(cat $target)"
}
