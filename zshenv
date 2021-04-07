# Make sure GPG TTY uses the TTY :D
export GPG_TTY=$(tty)

# Make sure usr bin then brew modules loads first
export PATH="${HOME}/bin:/usr/local/sbin:$PATH"

export EDITOR="vim"

source "$HOME/.cargo/env"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export STARSHIP_CONFIG="$HOME/.dotfile/starship.toml"

if [[ -s "$HOME/.pythonrc" ]]; then
  export PYTHONSTARTUP="$HOME/.pythonrc"
fi