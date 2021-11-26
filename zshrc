export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

source <("/usr/local/bin/starship" init zsh --print-full-init)

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

zinit light mafredri/zsh-async

# History
zinit snippet OMZ::lib/history.zsh
zinit ice silent wait"0"
zinit snippet OMZ::plugins/history/history.plugin.zsh
zinit ice silent wait"0"
zinit snippet OMZ::plugins/per-directory-history/per-directory-history.zsh
zinit ice silent wait"0"
zinit light zdharma/history-search-multi-word

zinit ice silent wait:1 atload:_zsh_autosuggest_start
zinit light zsh-users/zsh-autosuggestions

zinit ice blockf; zinit light zsh-users/zsh-completions

zinit ice silent wait"0" atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

####  zinit loaded plugin finished ####

## Zinit snippets
zinit is-snippet for OMZ::plugins/iterm2/iterm2.plugin.zsh
zinit is-snippet for OMZ::plugins/extract/extract.plugin.zsh

export AUTOSWITCH_DEFAULT_PYTHON="/usr/bin/python3"
zinit load MichaelAquilina/zsh-autoswitch-virtualenv

# ZSH native config

# Menu based completion
zstyle ':completion:*' menu select

# Use mouse scroll as pager
export LESS=-FR

# iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load brew specific zsh conf
source "${HOME}/.dotfile/zsh-custom/brewconfpath.zsh"

# Load custom aliases
source "${HOME}/.dotfile/zsh-custom/alias.zsh"

# Load custom functions
source "${HOME}/.dotfile/zsh-custom/functions.zsh"

# Load local functions and custom configs with secrets
source "${HOME}/.localconf.zsh"
