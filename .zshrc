# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases and PATH setup
alias nv='nvim'
alias py='python3'
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"

# Powerlevel10k theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Tmux autostart
if [ -z "$TMUX" ]; then
  tmux attach-session -t TMUX 2>/dev/null || tmux new-session -s TMUX
fi

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

# Zsh plugin sources
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 

# Run neofetch on startup
neofetch

