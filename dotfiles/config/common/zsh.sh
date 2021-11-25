# fix fg to be the same as bash
fg() {
  if [[ $# -eq 1 && $1 = - ]]; then
    builtin fg %-
  else
    builtin fg %"$@"
  fi
}

# be able to bounce back and forth between the terminal with the same binding
bindkey -s '^Z' 'fg\n'  # C-Z

# zle movement
bindkey '^[[1;9C' forward-word    # C-<Right>
bindkey '^[[1;5C' forward-word    # C-<Right>
bindkey '^[[1;9D' backward-word   # C-<Left>
bindkey '^[[1;5D' backward-word   # C-<Left>
bindkey "^[[3;5~" kill-word       # C-<DEL>

# backwards delete to non-alphanumeric character, better for editing urls
my-backward-delete-word () {
    local WORDCHARS='~!#$%^&*(){}[]<>?+;'
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

eval "$(starship init zsh)"
eval "$(brew shellenv)"
source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"


