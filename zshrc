export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

starship_path=$(command -v starship)
source <("$starship_path" init zsh --print-full-init)

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit light mafredri/zsh-async

# History
zinit snippet OMZ::lib/history.zsh
zinit ice silent wait"0"
zinit snippet OMZ::plugins/history/history.plugin.zsh
zinit ice silent wait"0"
zinit light zdharma-continuum/history-search-multi-word
zinit light-mode wait lucid for OMZ::plugins/autojump/autojump.plugin.zsh

zinit ice silent wait:1 atload:_zsh_autosuggest_start
zinit light zsh-users/zsh-autosuggestions

zinit ice blockf; zinit light zsh-users/zsh-completions

zinit ice silent wait"0" atinit"zpcompinit; zpcdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light MichaelAquilina/zsh-you-should-use

####  zinit loaded plugin finished ####

## Zinit snippets
zinit is-snippet for OMZ::plugins/iterm2/iterm2.plugin.zsh
zinit is-snippet for OMZ::plugins/extract/extract.plugin.zsh

export AUTOSWITCH_DEFAULT_PYTHON="$(which python3)"
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

# Created by `pipx` on 2023-01-08 16:08:10
export PATH="$PATH:/Users/subho/.local/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
