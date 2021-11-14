# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/nvm/init-nvm.sh

set -o vi
export VISUAL=vim
export EDITOR="$VISUAL"

# Command history
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

# set PATH so it includes user's private bin if it exists
if [ -d ~/.local/bin ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Alias definitions
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
