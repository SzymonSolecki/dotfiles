# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.


# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM=xterm-256color
export TERMINAL=termite

# Path to your oh-my-zsh installation.
ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH=/home/szymon/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
export VISUAL=nvim
export EDITOR="$VISUAL"
export QT_QPA_PLATFORMTHEME="qt5ct"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

plugins=(
  git
  zsh-autosuggestions 
)

source ~/.zsh_functions
source $ZSH/oh-my-zsh.sh
bindkey -v
bindkey '^R' history-incremental-search-backward
export PATH=$PATH:/home/szymon/bin
export PATH=$PATH:/usr/local/go/bin



alias c='cd ~/.config'
export PATH="${PATH}:${HOME}/.local/bin/"
alias r='ranger'
alias vtop="vtop -t certs"
alias gits='git status'
alias cfp='cd ~/.config/polybar'
alias cfi='vim ~/.config/i3/config'
alias cfz='vim ~/.zshrc'
alias cfx='vim ~/.Xresources'
alias cfv='vim ~/.vimrc'
alias cdc='cd && clear && neofetch'
alias clc='clear'
alias D='cd ~/Downloads'
alias PS='cd ~/Pictures/Screenshots'
alias PP='cd ~/Pictures'
alias l='ls -alh'
alias vim='nvim'
alias open='xdg-open'

alias fp='cd "$(find ~/Documents/Dev -maxdepth 2 -type d | sed 1d | fzf)"'
alias fd='cd "$(find . -type d | sed 1d | fzf)"'

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "\e[3~" delete-char

bindkey '^ ' autosuggest-accept
# eval "`dircolors -b ~/.dircolors`"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

