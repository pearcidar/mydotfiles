# _____ ___
#|_   _|_ _|
#  | |  | |
#  | |  | |
#  |_| |___| .zshrc
#

# exports
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin${PATH:+:${PATH}}"
export EDITOR="nvim"
export BROWSER="qutebrowser"
export ZSH="$HOME/.oh-my-zsh"
export TERM="st-256color"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

autoload -U colors && colors    # Load colors
#PS1="%B%{$fg[red]%}%{$fg[magenta]%}%{$fg[white]%}%{$fg[cyan]%}%{$fg[blue]%}%~%{$fg[black]%}]%{$fg[green]%}#%{$fg[red]%} "
# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history
ZSH_THEME="duellj"
plugins=(git)
source $ZSH/oh-my-zsh.sh 

# autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

bindkey -v
export KEYTIMEOUT=1

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

alias ls="exa --icons"
alias vim="nvim"
alias cat="bat --theme base16"
alias hex="colorscript -e hex"
alias ed="ed -p ' >> '"
alias keybinds="vim ~/.config/sxhkd/sxhkdrc"
alias polybarconfig="vim ~/.config/polybar/config"
alias zshrc="vim ~/.zshrc"
alias top="btm"
alias alacyml="vim ~/.config/alacritty/alacritty.yml"
alias colhex="colorscript -e hex"
alias vimconfig="vim ~/.config/nvim/init.vim"
alias grep="rg"
alias matrix='unimatrix -s 95'
alias nc="newsboat"
alias col="colorscript -e colortest"

# shell-color-scripts at startup
colorscript random

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
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


eval $(thefuck --alias)
