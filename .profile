ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
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

ff() {
	cd "$(find $(find ./* -prune -type d) -type d | fzf)"
}
open() {
	xdg-open "$(find $(find ./* -prune) -type f | fzf)"
}
getpath() {
	find $(find ./* -prune) -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -sel clip
}

#PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\]'

#PS1='\[\033[1;38;5;007m\][\[\033[1;38;5;004m\]\u\[\033[1;38;5;007m\]@\[\033[1;38;5;001m\]arch\[\033[1;38;5;007m\]: \[\033[1;38;5;243m\]\W\[\033[1;38;5;007m\]]\$ \[\033[00m\]'

export PATH=$HOME/.local/share/scripts:$PATH
export PATH=$HOME/suckless/dwmblocks/bar-scripts:$PATH
export PATH=$HOME/.local/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"


#ALIASES
alias sc="cd ~/.local/share/scripts"
alias bsc="cd ~/Programs/suckless/dwmblocks/bar-scripts"
alias uni="cd ~/Documents/uni"
alias u5="cd /home/ziga/Documents/uni/5.letnik"
alias suc="cd ~/Programs/suckless"
alias conf="cd ~/.config"
alias sxrc="vim ~/.config/sxhkd/sxhkdrc"
alias strc="vim ~/suckless/st/config.h"
alias dwmrc="vim ~/Programs/suckless/dwm/config.h"
alias brc="vim ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias doc="cd ~/Documents"
alias pic="cd ~/Pictures"
alias tor="cd ~/Torrents"
alias mu="cd ~/Music"
alias cdnet="cd ~/.local/share/scripts/net_speed"
alias vim="nvim"
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias sr="sudo ranger ."
alias walls="cd ~/Pictures/walls"
alias scrot="cd ~/Pictures/screenshots"
alias smi="sudo make install"
alias smci="sudo make clean install"
alias p="sudo pacman"
alias scx="sudo chmod +x"
alias xresources_reload="xrdb ~/.Xresources"
alias untar="tar -xvzf"
alias c="clear"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

alias music='tmux new-session -s $$ "tmux source-file ~/.config/ncmpcpp/tsession"'
_trap_exit() { tmux kill-session -t $$; }
trap _trap_exit EXIT

alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"

alias gcm="git commit -m"
alias ga="git add ."
alias gpom="git push -u origin master"


if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx
fi
