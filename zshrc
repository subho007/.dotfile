
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

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

load=light


zinit $load mafredri/zsh-async
zinit $load sindresorhus/pure

zinit ice silent wait:1 atload:_zsh_autosuggest_start
zinit $load zsh-users/zsh-autosuggestions

zinit ice blockf; zinit $load zsh-users/zsh-completions

zinit ice silent wait:1; zinit $load zpm-zsh/ls

zinit ice silent wait!1 atload"ZINIT[COMPINIT_OPTS]=-C; zpcompinit"
zinit $load zdharma/fast-syntax-highlighting
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

alias git=hub
alias g=git

export GPG_TTY=$(tty)

export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export THEOS=~/theos

export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export ANDROID_NDK_HOME="/usr/local/share/android-ndk"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/m4/bin:$PATH"
