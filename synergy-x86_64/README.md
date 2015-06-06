Run with : 
```
sudo docker run -t -i \
        -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 \
        -v $HOME/.Xauthority:$HOME/.Xauthority \
        -e HOME=$HOME \
        --hostname $(hostname) \
        -p 24800:24800 \
        arcamael/synergy:1.4.15 bash -c "
cat > /etc/synergy.conf << DELIM
section: screens
        raspberrypi:
        laptop:
end
section: links
        laptop:
                right = raspberrypi
        raspberrypi:
                left = laptop
end
DELIM
synergys -f
"
```
