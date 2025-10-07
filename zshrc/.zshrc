# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.

# Aliases and PATH setup
alias nv='nvim'
alias py='python3'
alias ls='eza --icons=auto'                                         # short list
alias switcher=~/switch-theme.sh
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"

# history stuff
# History file and size
HISTFILE=~/.zsh_history
HISTSIZE=1000000       # Number of lines kept in memory
SAVEHIST=1000000       # Number of lines written to HISTFILE

# Share history across all zsh sessions
setopt INC_APPEND_HISTORY      # Add commands to the history file immediately
setopt SHARE_HISTORY           # Share history between all sessions
setopt HIST_IGNORE_DUPS        # Ignore duplicate commands
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks
setopt HIST_VERIFY             # Don’t execute command straight from history
setopt BANG_HIST               # Treat '!' specially (for !! etc.)
setopt EXTENDED_HISTORY        # Save timestamp of command and duration



# Other environment variables and configurations
# export TERM=xterm-256color
export TERM=screen-256color
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"

# Zsh plugins
plugins=(
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# auto comple
# tab brings up menu
bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete
# tab through options
bindkey -M menuselect              '^I'         menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete
# Zsh plugin sources

# make arrow keys edit chars
bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char
# enter
bindkey -M menuselect '^M' .accept-line
# Run neofetch on startup
eval "$(zoxide init zsh)"
eval $(thefuck --alias)
eval "$(starship init zsh)"

[ -f "/home/d3/.ghcup/env" ] && . "/home/d3/.ghcup/env" # ghcup-env

# bun completions
[ -s "/home/d3/.bun/_bun" ] && source "/home/d3/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
