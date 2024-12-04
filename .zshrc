alias nv='nvim'
alias py='python3'
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
eval "$(zoxide init zsh)"
# tmux autostart
# if [ -z $TMUX ]; then; tmux -t TMUX || tmux new -s TMUX; fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
export TERM=xterm-256color
# plugins = (
# 	tmux
# 	zsh-autosuggestions
# 	zsh-syntax-highlighting
# )
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
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# bun completions
# [ -s "/home/delster3/.bun/_bun" ] && source "/home/delster3/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
eval "$(starship init zsh)"
neofetch --disable packages

