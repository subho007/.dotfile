# Load Brew completions together
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

[[ /usr/local/bin/kubectl ]] && source "${HOME}/.dotfile/zsh-custom/kubectlcompletion.zsh"

#  Hacky way to check if the folder exists because we don't want to do brew list which takes lot of time
if [[ -d "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/" ]]; then
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

if [[ -d "/usr/local/opt/make/libexec" ]]; then
    export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
fi

if [[ -d "/usr/local/opt/openssl@1.1/bin" ]]; then
    export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
fi

if [[ -d "/usr/local/opt/sqlite/bin" ]]; then
    export PATH="/usr/local/opt/sqlite/bin:$PATH"
fi

if [[ -d "/usr/local/opt/m4/bin" ]]; then
    export PATH="/usr/local/opt/m4/bin:$PATH"
fi

if [[ -d "/usr/local/share/guile/site/3.0" ]]; then
    export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
    export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
    export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
fi

if [[ -d "/usr/local/opt/openjdk/bin" ]]; then
    export PATH="/usr/local/opt/openjdk/bin:$PATH"
fi

if [[ -d "/usr/local/opt/texinfo/bin" ]]; then
    export PATH="/usr/local/opt/texinfo/bin:$PATH"
fi

if [[ -f "/usr/local/bin/zoxide" ]]; then
    eval "$(zoxide init zsh)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#  Template below
# if [[ -d "<path to directory>" ]]; then

# fi
