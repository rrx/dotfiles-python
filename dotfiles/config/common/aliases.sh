alias gco='git checkout'
alias gc='git commit'
alias gb='git branch'
alias gs='git status'
alias gp='git push'
alias ga='git add'
alias gd='git diff'
alias reload='eval "$(python3 -m dotfiles init)"'
alias kc='kubectl'
alias k='kubectl'
alias lg='lazygit -ucf ${DOTFILES_DIR}/config/lazygit/config.yml'

# aliases
alias e="$EDITOR"

alias zreload="source ~/.zshrc"
alias zr="source ~/.zshrc"

alias h="history"

function sys-install() {
  python3 -m dotfiles install | bash
}

# See: https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/
function shell-benchmark() {
  for i in $(seq 1 10); do /usr/bin/time $SHELL -i -c exit; done
}

