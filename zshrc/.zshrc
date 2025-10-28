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
ENABLE_CORRECTION="true"


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
alias cd="z"
alias nv="nvim"
alias nvconf="nvim ~/.dotfiles/nvim/.config/nvim/"
alias nvzshrc="nvim ~/.dotfiles/zshrc/.config/.zshrc"
alias py="python3"


# PACKAGES
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
