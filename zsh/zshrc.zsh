# Intall zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Setup compinit for zinit
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Create cache and completions dir and add to $fpath
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

# Load oh-my-zsh stuff
zinit wait lucid for \
    OMZL::clipboard.zsh \
    OMZL::completion.zsh \
    OMZL::directories.zsh \
    OMZL::git.zsh \
    OMZL::grep.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh \
    OMZL::theme-and-appearance.zsh

zinit wait lucid for \
    OMZP::cp \
    OMZP::git

# Load other plugins
zinit wait lucid for \
    zsh-users/zsh-completions \
    zdharma-continuum/history-search-multi-word \
    zdharma-continuum/fast-syntax-highlighting \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions

# Load custom
zinit wait lucid is-snippet for \
    ${HOME}/.dotfiles/zsh/custom/alias.zsh

# Load themes
setopt promptsubst
zinit ice depth"1" # git clone depth
zinit light agnoster/agnoster-zsh-theme
