# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM=xterm-256color
export TERMINAL=termite
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/szymon/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
export VISUAL=nvim
export EDITOR="$VISUAL"
export QT_QPA_PLATFORMTHEME="qt5ct"
##########################
#ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="bullet-train"
##########################
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions 
  zsh-256color
)


source ~/.bashrc
source ~/.zsh_functions
source $ZSH/oh-my-zsh.sh
bindkey -v
bindkey '^R' history-incremental-search-backward
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
export PATH=$PATH:/home/szymon/bin
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


#export KEYTIMEOUT=1
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#BULLETTRAIN_DIR_BG="blue"
#BULLETTRAIN_DIR_FG="black"
#BULLETTRAIN_DIR_EXTENDED="2"
#
#BULLETTRAIN_CONTEXT_BG="black"
#BULLETTRAIN_CONTEXT_FG="blue"
#
#BULLETTRAIN_PROMPT_CHAR=" "
#BULLETTRAIN_TIME_BG="blue"
#BULLETTRAIN_TIME_FG="black"

#alias spo='snap run spotify --disable-gpu &'
alias c='cd ~/.config'
#export PATH=/home/szymon/bin:$PATH
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
alias l='lsd -Fla'
alias vim='nvim'
alias open='xdg-open'


# Set name of the theme to load.

#neofetch
numlockx on

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "\e[3~" delete-char


eval $(thefuck --alias)

# Open a new window in this term's cwd
alias nw="termite"
nwZle() { zle push-line; BUFFER="nw"; zle accept-line; }
zle -N nwZle
# CTRL+n
bindkey '^n' nwZle

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
