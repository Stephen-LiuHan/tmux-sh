#!/bin/bash

#作業ディレクトリフルパス名
WORK_DIR="$HOME/program/"
#セッション名
SESSION="default"
#ウィンドウ名
WINDOW="main_window"
tmux new-session -d -s $SESSION -n $WINDOW -c $WORK_DIR
tmux split-window -v -c "$WORK_DIR"
tmux split-window -h -c "$WORK_DIR" -t $WINDOW.0
tmux split-window -h -c "$WORK_DIR" -t $WINDOW.1
tmux split-window -v -c "$DIR" -t $WINDOW.2
tmux split-window -h -c "$DIR" -t $WINDOW.4
#下部ペインサイズ変更
tmux select-pane -t $WINDOW.0
tmux resize -D 20
tmux resize -R 30
tmux select-pane -t $WINDOW.2
tmux resize -U 30 
tmux select-pane -t $WINDOW.4
tmux resize -L 30
tmux select-pane -t $WINDOW.0
#初期コマンド
tmux send-keys -t $WINDOW.0 'vim -S Session.vim' C-m
tmux send-keys -t $WINDOW.1 'echo "for ssh"' C-m
tmux send-keys -t $WINDOW.2 'pwd' C-m
tmux send-keys -t $WINDOW.2 'ls' C-m
tmux send-keys -t $WINDOW.3 'git' C-m
tmux send-keys -t $WINDOW.4 'cal' C-m
tmux send-keys -t $WINDOW.5 'top' C-m
#セッション名を指定してアタッチ
tmux attach -t $SESSION
