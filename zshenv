# Make sure GPG TTY uses the TTY :D
export GPG_TTY=$(tty)

# Make sure usr bin then brew modules loads first
export PATH="${HOME}/bin:/usr/local/sbin:$PATH"

# Load python from homebrew
if [[ -d "/usr/local/opt/python/libexec/bin" ]]; then
    export PATH="/usr/local/opt/python/libexec/bin:$PATH"
fi

export EDITOR="vim"

source "$HOME/.cargo/env"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export STARSHIP_CONFIG="$HOME/.dotfile/starship.toml"

if [[ -s "$HOME/.pythonrc" ]]; then
  export PYTHONSTARTUP="$HOME/.pythonrc"
fi

export GREP_OPTIONS='--color=always'