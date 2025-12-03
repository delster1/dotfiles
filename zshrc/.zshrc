# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="false"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"


# PLUGINS
plugins=(
        git
        zsh-autocomplete
        zsh-autosuggestions
        zsh-syntax-highlighting
)

ZSH_CUSTOM="$HOME/.config/zsh"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# ALIASES
alias c="clear"
alias m="man"
alias bat="batcat"
alias v="nvim"
alias nv="nvim"
alias pls="sudo"
alias rl="exec zsh"
alias lg="lazygit" 
alias "portspls"="sudo netstat -tulpn"
alias ports="netstat -tulpn"

alias nvconf="nvim ~/.dotfiles/nvim/.config/nvim/."
alias nvzshrc="nvim ~/.dotfiles/zshrc/.zshrc"
alias "syncdots"="cd ~/.dotfiles && lg"

alias py="python3"

alias ls="eza -h --icons --git --color=always"
alias ll="eza -l --icons --git --color=always"
alias la="eza -la --icons --git --color=always"
alias lt="eza --tree --level=3 --icons --git --color=always"

alias tmas="tmux attach-session"
alias tma="tmux attach -t"
alias tmn="tmux new -s"
alias tml="tmux ls"
alias tmsrc="tmux source-file ~/.config/tmux/tmux.conf"
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."

alias gs="git status"
alias ga="git add"
alias gA="git add -A"
alias gp="git pull"
alias gP="git push"
alias gcm="git commit"
alias gba="git branch -a"
alias gm="git merge"
alias gco="git checkout"
alias gdm="git diff main"
alias gd="git diff"
alias "git yolo"="git add -A && git commit -m \"force pushing lmao, yolo\" && git push --force"

alias spt="spotify_player"

# PACKAGES
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# PATHS 
#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/d3/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/d3/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/d3/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/d3/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH=$PATH:/usr/local/go/bin

# opencode
export PATH=/home/d3/.opencode/bin:$PATH
export PATH=$PATH:/home/d3/.dotfiles/update_configs
