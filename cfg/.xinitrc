# X

setxkbmap -option caps:escape
setxkbmap -option compose:ralt

xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
xinput set-prop "MOSART Semi. 2.4G Wireless Mouse" "libinput Accel Speed" -1

xsetroot -cursor_name left_ptr
xsetroot -solid "#1f1f1f" 

#exec dwm
exec i3

