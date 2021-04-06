
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

load=light

zinit $load mafredri/zsh-async
zinit $load sindresorhus/pure

zinit ice silent wait:1 atload:_zsh_autosuggest_start
zinit $load zsh-users/zsh-autosuggestions

zinit ice blockf; zinit $load zsh-users/zsh-completions

zinit ice silent wait!1 atload"ZINIT[COMPINIT_OPTS]=-C; zpcompinit"
zinit $load zdharma/fast-syntax-highlighting

####  zinit loaded plugin finished ####

# iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Make sure usr bin then brew modules loads first
export PATH="${HOME}/bin:/usr/local/sbin:$PATH"

# Make sure GPG TTY uses the TTY :D
export GPG_TTY=$(tty)

# Load brew specific zsh conf
source "${HOME}/.dotfile/zsh-custom/brewconfpath.zsh"

# Load custom aliases
source "${HOME}/.dotfile/zsh-custom/alias.zsh"

# Load custom functions

# Load local functions and custom configs with secrets
source "${HOME}/.localconf.zsh"
