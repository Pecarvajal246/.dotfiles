function spoweroff --description 'Stop containers, then power off'
    sudo /usr/local/bin/stop-containers
    sudo systemctl poweroff
end
