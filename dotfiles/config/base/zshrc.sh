eval "$(python3 -m dotfiles init)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"


export AWS_SDK_LOAD_CONFIG=true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
