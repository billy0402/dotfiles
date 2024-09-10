# Intall zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname ${ZINIT_HOME})"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"
source "${ZINIT_HOME}/zinit.zsh"

# Setup compinit for zinit
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Create cache and completions dir and add to $fpath (for oh-my-zsh plugins)
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

# Load oh-my-zsh stuff
zinit for \
    OMZL::history.zsh \
    OMZP::brew

zinit wait lucid for \
    OMZL::clipboard.zsh \
    OMZL::directories.zsh \
    OMZL::git.zsh \
    OMZL::grep.zsh \
    OMZL::theme-and-appearance.zsh \
    OMZL::completion.zsh \
    OMZL::key-bindings.zsh

zinit wait lucid for \
    OMZP::cp \
    OMZP::git

zinit wait lucid as"completion" for \
    OMZP::pip/_pip \
    OMZP::docker-compose/_docker-compose

# Load other plugins
zinit wait lucid for \
    zsh-users/zsh-completions \
    zdharma-continuum/history-search-multi-word \
    zdharma-continuum/fast-syntax-highlighting

# 改用這個套件因為 oh-my-zsh 的補全有問題，補全的部份吃 zsh-completions 中的，lazy load 的部分讓 zinit 處理
zinit wait lucid for \
    lukechilds/zsh-nvm

# 用這個 completion 才能補全 image 或 container 名稱，用 Oh-My-Zsh Plugin 所產的沒辦法
zinit wait lucid as"completion" for \
    https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zinit wait lucid for \
    id-as'poetry-completion' \
    as'completion' \
    atclone'poetry completions zsh > _poetry' \
    atpull'%atclone' \
    blockf \
    has'poetry' \
    nocompile \
        zdharma-continuum/null

zinit wait lucid for \
    id-as'uv-completion' \
    as'completion' \
    atclone'uv generate-shell-completion zsh > _uv' \
    atpull'%atclone' \
    blockf \
    has'uv' \
    nocompile \
        zdharma-continuum/null

# Load custom
zinit wait lucid is-snippet for \
    ${HOME}/.dotfiles/zsh/custom/alias.zsh

# Load autosuggestions (這個必須要是最後一個載入的 plugin 才不會造成 tab 按下後自動選取 autosuggestions 的內容)
# Fast syntax highlighting 也需要在最後才會正常顯示顏色
zinit wait lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions

# Load themes
setopt promptsubst
zinit ice depth"1" # git clone depth
zinit light agnoster/agnoster-zsh-theme
