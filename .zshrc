# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/awannaphasch2016/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    extract
    vi-mode    
)


source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# alias ll='colorls -lA --sd --group-directories-first'
# alias ls='colorls --group-directories-first'
# source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# export $POWERLEVEL9K_INSTANT_PROMPT=quiet

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cdd='cd ~/Documents'
alias cdw='cd ~/Documents/Working'
alias cdwind='cd /mnt/c/Users/Anak/Documents'
alias cdwinw='cd /mnt/c/Users/Anak/PycharmProjects'
cdl(){cd "$@" && ls;}

stty -ixon

export VISUAL=vim;
export EDITOR=vim;

export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh
export NVM_DIR="$HOME/.nvm"
  [ -s "/home/awannaphasch2016/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/awannaphasch2016/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/home/awannaphasch2016/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/home/awannaphasch2016/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# fzf from terminal
# reference: https://www.youtube.com/watch?v=1a5NiMhqAR0&ab_channel=TheModernCoder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fdfind --type f"
# export FZF_DEFAULT_COMMAND="fd --type -f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# NOTE: setting port forwarding to communicate with x server
# export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0 # in WSL 2
# export DISPLAY="`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0"
export DISPLAY=localhost:0
export LIBGL_ALWAYS_INDIRECT=1

export PATH=~/anaconda3/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/awannaphasch2016/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/awannaphasch2016/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/awannaphasch2016/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/awannaphasch2016/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# if you have chrome install in window OS
alias chrome='/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'

# override alt + . to get last argument 
# ref: https://stackoverflow.com/questions/8344699/how-to-repeat-the-last-part-of-a-previous-command
bindkey '\e.' insert-last-word
