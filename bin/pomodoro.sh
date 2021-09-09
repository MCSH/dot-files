

pomodor_wait(){
    if [ -z "$1" ]
    then
        M=45
    else
        M=$1
    fi

    TIME=$(($M * 60))

    notify-send "Pomodor session started for $M minutes"

    sleep $TIME && notify-send "Pomodor session ended!" && aplay /home/sajjad/bin/bell.wav
}

export -f pomodor_wait

nohup bash -c "pomodor_wait $1"  > /dev/null 2>&1 &
