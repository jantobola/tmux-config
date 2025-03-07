# Start TMUX session automatically
if [ "$TMUX" = "" ]; then
  tmux has-session -t TMUX
  if [ $? != 0 ]; then
    tmux new -s TMUX -n 'init';
  else
    tmux a -t TMUX
  fi
fi
