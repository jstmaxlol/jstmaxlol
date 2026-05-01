# X

export XDG_CURRENT_DESKTOP=i3
export XDG_SESSION_DESKTOP=i3
export DESKTOP_SESSION=i3
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_QPA_PLATFORMTHEME=qt5ct

setxkbmap -option caps:escape
setxkbmap -option compose:ralt

xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
xinput set-prop "MOSART Semi. 2.4G Wireless Mouse" "libinput Accel Speed" -1

xsetroot -cursor_name left_ptr
xsetroot -solid "#1f1f1f" 

# custom resolution
xrandr --newmode "1152x768_60.00" 71.75  1152 1208 1328 1504 768 771 781 798 -hsync +vsync
xrandr --addmode eDP-1 "1152x768_60.00"
xrandr --output eDP-1 --mode "1152x768_60.00"

#exec dwm
exec i3

