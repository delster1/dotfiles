# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.

# Aliases and PATH setup
alias nv='nvim'
alias py='python3'
alias switcher=~/switch-theme.sh
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"


# Other environment variables and configurations
export TERM=xterm-256color
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
eval "$(starship init zsh)"

[ -f "/home/d3/.ghcup/env" ] && . "/home/d3/.ghcup/env" # ghcup-env
