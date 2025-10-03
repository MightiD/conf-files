export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="myTheme"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

ENABLE_CORRECTION="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export ARCHFLAGS="-arch $(uname -m)"
export MAKEFLAGS="--jobs=$(nproc)"

alias fucking="sudo"
alias files="spf"
alias lf="spf"
alias ls='eza -a --icons'
alias year="cal -m -y"
alias win="sudo grub-reboot Windows && reboot"
alias venv="python -m venv venv && source ./venv/bin/activate"
alias ip="ip -c"
alias vim="nvim"

#scripts
alias sn="~/scripts/serialNumber.sh"
alias doughnut="python ~/scripts/doughnut.py"
alias wifi="~/scripts/wifi.sh"
alias vpn="~/scripts/vpn.sh"
alias audio="~/scripts/audioModes.sh"
alias bat="~/scripts/battery.sh"
alias get_esprs='. $HOME/export-esp.sh'

files=/media/mightid/Files

open() {
    nohup xdg-open "$@" > /dev/null 2>&1 &
}

eval $(thefuck --alias)

export EDITOR=nvim

# bun completions
[ -s "/home/mightid/.bun/_bun" ] && source "/home/mightid/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

fastfetch
