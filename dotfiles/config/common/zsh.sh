zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ${DOTFILES_DIR}/config/common/aliases.sh

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

source ~/.powerlevel10k/powerlevel10k.zsh-theme

#eval "$(starship init zsh)"

# set preferred commands
if [[ -f $(command -v alacritty) ]]; then
  export TERMINAL=alacritty
fi

source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

export SETGITCONFIG_CONF=~/.config/setgitconfig/config.toml
precmd() { ~/.cargo/bin/setgitconfig }

source $HOME/.cargo/env

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(fnm env)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="~/sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
