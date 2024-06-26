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

export FZF_DEFAULT_OPTS="\
--ansi \
--border=rounded \
--no-info \
--prompt '🢖 ' \
--pointer='🞂 ' \
--marker=' ' \
--color='16,bg+:-1,gutter:-1,prompt:5,pointer:5,marker:6,border:4,label:4,header:italic'"

export FZF_TMUX_OPTS="-p 55%,60%"

# zoxide
eval "$(zoxide init zsh)"

# golang
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
. ~/.asdf/plugins/golang/set-env.zsh            # sets GOROOT
export GOPATH=$HOME/go                          # sets GOPATH
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# plugins
for f in $ZDOTDIR/plugins/*.zsh; do source $f 2>/dev/null; done
