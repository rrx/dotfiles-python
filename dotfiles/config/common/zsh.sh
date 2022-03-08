# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zmodload zsh/zprof

source ${DOTFILES_DIR}/config/common/aliases.sh

# keybindings from omz
source ${DOTFILES_DIR}/config/common/key-bindings.zsh

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

# auto suggestions
[ ! -d ~/.zsh/plugins/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# clipboard
typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
typeset -g ZSH_SYSTEM_CLIPBOARD_SELECTION='PRIMARY'
[ ! -d ~/.zsh/plugins/zsh-system-clipboard ] && git clone https://github.com/kutsan/zsh-system-clipboard ~/.zsh/plugins/zsh-system-clipboard
source ~/.zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh > /dev/null


source ~/.powerlevel10k/powerlevel10k.zsh-theme

#eval "$(starship init zsh)"

# set preferred commands
if [[ -f $(command -v alacritty) ]]; then
  export TERMINAL=alacritty
fi

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source "$(env brew --prefix)/opt/fzf/shell/completion.zsh"
source "$(env brew --prefix)/opt/fzf/shell/key-bindings.zsh"

export SETGITCONFIG_CONF=~/.config/setgitconfig/config.toml
precmd() { ~/.cargo/bin/setgitconfig }

source $HOME/.cargo/env

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
export PATH=${HOME}/.fnm:$PATH
eval "$(fnm env)"

# mcfly for history
export MCFLY_RESULTS=40
export MCFLY_INTERFACE_VIEW=TOP
# eval "$(mcfly init zsh)"

# history from omz
source ${DOTFILES_DIR}/config/common/history.zsh

# search defaults
#export FZF_DEFAULT_COMMAND="ag -p $DOTFILES_DIR/config/common/search.ignore --hidden --ignore-dir=.git -g ''"
export FZF_DEFAULT_COMMAND="ag --hidden --ignore-dir=.git -g ''"
#export FZF_DEFAULT_OPTS="--layout=reverse --info=inline"
#export FZF_DEFAULT_COMMAND=rg --files --hidden
#export FZF_DEFAULT_COMMAND='fd -L --hidden --exclude .git'

# source local zsh config if it exists
test -f ~/.zshrc.local && source ~/.zshrc.local

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="~/sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
