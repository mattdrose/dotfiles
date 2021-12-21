# start new
alias t='tmux'
alias tn='tmux new -s'

# attach
alias ta='tmux a'
alias tan='tmux a -t'

# list
alias tl='tmux ls'

# kill
alias tk='tmux kill-session -t'

# all
alias tka='tmux ls | grep : | cut -d. -f1 | awk "{print substr($1, 0, length($1)-1)}" | xargs kill'

# tmux dev session
function tdev() {
  if [ $# -eq 0 ]
  then
    local session="tmux new -s dev"
  else
    local session="tmux a -t $@"
  fi
  
  $session \; split-window -v -p 60 \; split-window -hd \;
}
