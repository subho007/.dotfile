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

if [[ -d "/opt/homebrew/opt/make/libexec" ]]; then
    export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
fi

if [[ -d "/usr/local/opt/openssl@1.1/bin" ]]; then
    export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
fi

if [[ -d "/opt/homebrew/opt/openssl@3/bin" ]]; then
    export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
fi

if [[ -d "/usr/local/opt/sqlite/bin" ]]; then
    export PATH="/usr/local/opt/sqlite/bin:$PATH"
fi

if [[ -d "/opt/homebrew/opt/sqlite/bin" ]]; then
    export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
fi

if [[ -d "/usr/local/opt/m4/bin" ]]; then
    export PATH="/usr/local/opt/m4/bin:$PATH"
fi

if [[ -d "/usr/local/opt/openjdk/bin" ]]; then
    export PATH="/usr/local/opt/openjdk/bin:$PATH"
fi

if [[ -d "/opt/homebrew/opt/openjdk/bin" ]]; then
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

command -v fnm >/dev/null 2>&1 && eval "$(fnm env)"

if command -v pyenv >/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    # load the pyenv to PATH
    eval "$(pyenv init --path)"
    # initialize pyenv
    eval "$(pyenv init -)"
    export AUTOSWITCH_DEFAULT_PYTHON="$(which python3)"
fi

if [[ -f "/usr/local/bin/go" ]] || [[ -f "/opt/homebrew/bin/go" ]] then
    export PATH=$PATH:$(go env GOPATH)/bin
    export GOPATH=$(go env GOPATH)
fi

#  Template below
# if [[ -d "<path to directory>" ]]; then

# fi


if [[ -f "/usr/local/bin/zoxide" ]] || [[ -f "/opt/homebrew/bin/zoxide" ]] then
    autoload -Uz compinit
    eval "$(zoxide init zsh --no-cmd --cmd cd)"
fi

export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"