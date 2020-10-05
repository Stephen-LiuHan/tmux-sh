#!/bin/bash

#作業ディレクトリフルパス名
WORK_DIR="$HOME/program/"
#セッション名
SESSION="worthtry"
#ウィンドウ名
WINDOW="main_window"
tmux new-session -d -s $SESSION -n $WINDOW -c $WORK_DIR
tmux split-window -v -c "$WORK_DIR"
tmux split-window -h -c "$WORK_DIR" -t $WINDOW.0
tmux split-window -h -c "$WORK_DIR" -t $WINDOW.1
tmux split-window -v -c "$WORK_DIR" -t $WINDOW.1
tmux split-window -v -c "$DIR" -t $WINDOW.3
tmux split-window -h -c "$DIR" -t $WINDOW.5
#下部ペインサイズ変更
tmux select-pane -t $WINDOW.0
tmux resize -D 20
tmux resize -R 30
#tmux select-pane -t $WINDOW.1
tmux select-pane -t $WINDOW.4
tmux resize -U 30 
tmux select-pane -t $WINDOW.5
tmux resize -L 30
tmux select-pane -t $WINDOW.0
#初期コマンド
tmux send-keys -t $WINDOW.0 'vim -S Session.vim' C-m
tmux send-keys -t $WINDOW.1 'ssh -i ~/ssh/worthtry wataru@192.168.8.108' C-m
tmux send-keys -t $WINDOW.2 'ssh -p 2434 -i ~/ssh/worthtry wataru@192.168.8.107' C-m
tmux send-keys -t $WINDOW.3 'pwd' C-m
tmux send-keys -t $WINDOW.3 'ls' C-m
tmux send-keys -t $WINDOW.4 'git' C-m
tmux send-keys -t $WINDOW.5 'cal' C-m
tmux send-keys -t $WINDOW.6 'top' C-m

sleep 2 

tmux send-keys -t $WINDOW.1 'Stephen' C-m

#セッション名を指定してアタッチ
tmux attach -t $SESSION
