function sreboot --description 'Stop containers, then reboot'
    sudo /usr/local/bin/stop-containers
    sudo systemctl reboot
end
