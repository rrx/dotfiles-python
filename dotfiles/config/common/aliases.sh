alias gco='git checkout'
alias gc='git commit'
alias gb='git branch'
alias gs='git status'
alias gp='git push'
alias ga='git add'
alias gd='git diff'

# interactively navigate git branches
alias gch='git checkout $(git branch --sort=-committerdate --format="%(refname:short)"| fzf)'

alias reload='eval "$(python3 -m dotfiles init)"'
alias kc='kubectl'
alias k='kubectl'
alias lg='lazygit -ucf ${DOTFILES_DIR}/config/lazygit/config.yml'

# aliases
alias e="$EDITOR"

alias zreload="source ~/.zshrc"
alias zr="source ~/.zshrc"

alias h="history"

# interactive cd
alias xcd='cd $(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv | fzf)'

# up directory shortcut
alias ..='cd ..'

# navigate to the root of the git repo
alias root='cd $(git rev-parse --show-toplevel)'

# script to navigate up directories
alias updir='cd $(python3 -m dotfiles updir | fzf --preview "tree -L 1 -C {} | head -200")'

function sys-install() {
  python3 -m dotfiles install | bash
}

# See: https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/
function shell-benchmark() {
  for i in $(seq 1 10); do /usr/bin/time $SHELL -i -c exit; done
}

function pre() {
  fzf --no-scrollbar --preview-window up,66% --preview 'bat --style=numbers --color=always --line-range :500 {}'
}

