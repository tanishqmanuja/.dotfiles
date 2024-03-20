# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zhistory
setopt appendhistory

# keybindings
bindkey -s '^F' 't^M'

# path
export PATH="$HOME/.config/bin:$PATH"

# completions
autoload -Uz compinit && compinit &> /dev/null 

# aliases
if [ -x "$(command -v exa)" ]; then
  alias ls="exa"
  alias ll="exa -l --icons"
  alias la="exa -a"
  alias l="exa -a"
fi

if [ -x "$(command -v bat)" ]; then
  alias cat="bat -p"
fi

alias vi="nvim"
alias vim="nvim"

# clipboard (MacOS)
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# short aliases
alias x="exit"

# functional aliases
function c() {
  if [ -z "$1" ]; then
    code .
  else
    code "$@"
  fi
}

function n() {
  if [ -z "$1" ]; then
    nvim
  else
    nvim "$@"
  fi
}

function go_win() {
  cd "/mnt/c/Users/tanishq/Projects" 
}

# exports
export EDITOR=nvim

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#f38ba8,fg+:-1,bg+:-1,hl+:#f38ba8
--color=info:#cba6f7,prompt:#cba6f7,pointer:#f38ba8,marker:#f38ba8,spinner:#f38ba8
'

export FZF_TMUX_OPTS='
-p 55%,60%
--color=dark
--color=fg:-1,bg:-1,hl:#f38ba8,fg+:-1,bg+:-1,hl+:#f38ba8
--color=info:#cba6f7,prompt:#cba6f7,pointer:#f38ba8,marker:#f38ba8,spinner:#f38ba8
'

# starship
eval "$(starship init zsh)"

# asdf
. "$HOME/.asdf/asdf.sh"

# asdf completions
fpath=(${ASDF_DIR}/completions $fpath)

# bun completions
[ -s "/home/tanishq/.bun/_bun" ] && source "/home/tanishq/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/tanishq/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
eval "$(zoxide init zsh)"

# golang
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
. ~/.asdf/plugins/golang/set-env.zsh            # sets GOROOT
export GOPATH=$HOME/go                          # sets GOPATH
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# plugins
for f in $ZDOTDIR/plugins/*.zsh; do source $f 2>/dev/null; done
