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
    export USE_GKE_GCLOUD_AUTH_PLUGIN=True
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

if [[ -d "/usr/local/opt/bzip2/bin" ]]; then
    export PATH="/usr/local/opt/bzip2/bin:$PATH"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ /usr/local/bin/fnm ]] && eval "$(fnm env)"

if [[ /usr/local/bin/pyenv ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    # load the pyenv to PATH
    eval "$(pyenv init --path)"
    # initialize pyenv
    eval "$(pyenv init -)"
    export AUTOSWITCH_DEFAULT_PYTHON="$(which python3)"
fi

if [[ -f "/usr/local/bin/go" ]]; then
    export PATH=$PATH:$(go env GOPATH)/bin
    export GOPATH=$(go env GOPATH)
fi

if [[ -f "/usr/local/opt/postgresql@13/bin/psql" ]]; then
    export PATH="/usr/local/opt/postgresql@13/bin:$PATH"
fi

if [[ -d "/usr/local/share/android-ndk" ]]; then
    export ANDROID_NDK_HOME="/usr/local/share/android-ndk"
    export ANDROID_NDK_ROOT=$ANDROID_NDK_HOME
fi

#  Template below
# if [[ -d "<path to directory>" ]]; then

# fi


export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

if [[ -f "/usr/local/bin/zoxide" ]]; then
    autoload -Uz compinit
    eval "$(zoxide init zsh)"
fi