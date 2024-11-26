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

function expand-user-path() {
  python3 -c "import sys,os;print(os.path.expanduser(sys.argv[1]))" $1
}

alias pj='cd $(python3 -c "import sys,os;print(os.path.expanduser(sys.argv[1]))" $(cat ~/.projects| fzf))'

alias f="fzf | pbcopy"

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

alias ku='kubectl config use-context $(kubectl config view -o json | jq -r ".clusters | .[] | .name" | fzf)'

function kubectlgetall {
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
    echo "Resource:" $i

    if [ -z "$1" ]
    then
        kubectl get --ignore-not-found ${i}
    else
        kubectl -n ${1} get --ignore-not-found ${i}
    fi
  done
}

function terminate-namespace {
  kubectl proxy &
  kubectl get namespace $1 -o json |jq '.spec = {"finalizers":[]}' >temp.json
  curl -k -H "Content-Type: application/json" -X PUT --data-binary @temp.json 127.0.0.1:8001/api/v1/namespaces/$1/finalize
}
