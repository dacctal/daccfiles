#/bin/sh

waybar &

easyeffects --gapplication-service &

swaybg -i ~/snc/pic/wall/solid-color-image.jpeg &

# my monitors (yours will be different)
wlr-randr --output DP-2 --mode 1920x1080@144Hz &
wlr-randr --output DP-1 --mode 1920x1080@75Hz &
wlr-randr --output HDMI-A-1 --custom-mode 1920x1080@50Hz
