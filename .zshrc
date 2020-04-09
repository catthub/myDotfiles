# added by Anaconda3 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

export PATH="$HOME/.cargo/bin:$PATH:/Users/icattus/.cargo/bin"
eval "$(starship init zsh)"
export TERM=xterm-256color
export LANG=ja_jp.UTF-8
export DISPLAY=localhost:0.0
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## path function
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

cd() {
    builtin cd "$@" && exa -l
}

icloud() {
  cd $HOME/Library/Mobile\ Documents/com~apple~"$1"/Documents
}

## dictionary
dict() {
  open dict://$1;
}


export XDG_CONFIG_HOME="$HOME/.config"

alias arduino="/Applications/Arduino.app/Contents/MacOS/Arduino"
alias studypython="cd ~/cattus/workspace/StudyPython"
alias apple="screenfetch"
alias help="run-help"
alias e="exa -l"
alias ea="exa -al"
alias eat="exa -a --tree"
alias et="exa --tree"
alias drop="cd $HOME/Dropbox"
alias kara="cd $HOME/.config/myDotFiles/karabiner/assets/complex_modifications"
alias mypro="cd /Users/icattus/cattus/lab/exp/projects"
alias ..="cd .."
alias mycds="cd /Users/icattus/cattus/codes"
alias myconf="cd $HOME/.config/myDotFiles"
alias mycom="cd $HOME/.config/mycom"
alias myini="cd && cat .config/nvim/init.vim"
alias mylang="cd && cat .config/nvim/toml/lang.toml"
alias mywk="cd $HOME/cattus/workspace"
alias launch="open -a Launchpad"
alias chrome="open -a Google\ Chrome"
alias vimcom="open -a Google\ Chrome http://motw.mods.jp/Vim/command.html"
alias widget="cd ~/Library/Application\ Support/Übersicht/widgets/"
alias colors='for i in {0..255}; do printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"; done | xargs'
alias icat="kitty +kitten icat"

## tmux
alias sv="tmux split-window -h"
alias sp="tmux split-window -v"
alias nw="tmux new-window"
alias tmkp="tmux kill-pane"
alias tmkS="tmux kill-server"
alias tmks="tmux kill-session"
alias tmkw="tmux kill-window"
alias tmnew="tmux a || tmux new-session \; source-file $HOME/.config/myDotFiles/tmux/tmnewsetup"
if [[ -n $TMUX ]]; then
else
  tmux a || tmux
fi

killkitty() {
  pkill kitty ; tmkS
}
# reveal.js
alias open_rev="cd ~/reveal.js; npm start"

## yabai wm
source $HOME/.yabairc
