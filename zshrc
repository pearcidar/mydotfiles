# _____ ___
#|_   _|_ _|
#  | |  | |
#  | |  | |
#  |_| |___| .zshrc
#

# exports
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin${PATH:+:${PATH}}"
# default programs defined
export EDITOR="nvim"
export BROWSER="qutebrowser"
export TERM="st-256color"
# Beautifying less 
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

autoload -U colors && colors    # Load colors
#PS1="%B%{$fg[red]%}%{$fg[magenta]%}%{$fg[white]%}%{$fg[cyan]%}%{$fg[blue]%}%~%{$fg[black]%} >%{$fg[green]%} #%{$fg[red]%} "
ZSH_THEME="robbyrussell"
# History in cache directory [ I like big numbers :) ] :
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# setup the git plugin (the only reason I use OMZ):
plugins=(git)

# autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

bindkey -v
export KEYTIMEOUT=1

# keymap selection
function zle-keymap-select () {
	case $KEYMAP in
		vicmd) echo -ne '\e[1 q';;
		viins|main) echo -ne '\e[1 q';;
	esac
	
}
zle -N zle-keymap-select 
zle-line-init() {
	zle -K viins
	echo -ne "\e[1 q"
}
zle -N zle-line-init
echo -ne '\e[1 q'
preexec() { echo -n '\e[1 q' ;}

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/[NORM]}/(main|viins)/[INS]}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
# source the OMZ sh file
source $ZSH/oh-my-zsh.sh

# aliases (not a lot)
alias ls="exa --icons"
alias vim="nvim"
alias cat="bat --theme base16"
alias hex="colorscript -e hex"
alias ed="ed -p ' >> '"
alias keybinds="vim ~/.config/sxhkd/sxhkdrc"
alias polyconfig="vim ~/.config/polybar/config"
alias zshrc="vim ~/.zshrc"
alias top="btm"
alias alacritty.yml="vim ~/.config/alacritty/alacritty.yml"
alias colhex="colorscript -e hex"
alias vimconfig="vim ~/.config/nvim/init.vim"
alias grep="rg"
alias matrix='unimatrix -s 95'
alias nc="newsboat"
alias col="colorscript -e colortest"


# shell-color-scripts at startup
colorscript random

# Use sudo as alias of doas:
alias sudo="doas"

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
# edit line with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# set vi mode function
set -o vi

# source some theming plugins
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# And of course..
eval $(thefuck --alias)
