setxkbmap -layout us
xscreensaver -no-splash &
xsetroot -cursor_name left_ptr


xrandr --output eDP1 --mode 1920x1080 --output DP2 --mode 1920x1080 --right-of eDP1

exec dbus-launch xmonad
