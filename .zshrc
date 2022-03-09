# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "$HOME/.cache/zsh/zcompdump-$ZSH_VERSION"
_comp_options+=(globdots) # Include hidden files.

# Vim-like key-bindings
set -o vi
bindkey -v '^?' backward-delete-char
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Plugins
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/nvm/init-nvm.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/joey/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/joey/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/joey/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/joey/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
