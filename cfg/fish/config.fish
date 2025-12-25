# ~/.config/fish/config.fish
if status is-interactive

    # here for redundancy
    setxkbmap -option compose:ralt

	# ENVIRONMENT VARIABLES
	set -x EDITOR nvim
	set -x TERMINAL alacritty
	set -x VIMRUNTIME "/usr/share/nvim/runtime"
    #set -x WINEPREFIX ~/winestuff/ps2018
	set -x WINEARCH win64
    export GTK_IM_MODULE=ibus
    export QT_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus

	# ALIASES
	alias v nvim
    alias b bat
	alias ff fastfetch
	alias nf nfetch
	alias src "source ~/.config/fish/config.fish"
	alias vimrc "nvim ~/.vimrc"
	alias frc "nvim ~/.config/fish/config.fish"
	alias nvimrc "nvim ~/.config/nvim/init.vim"
	alias ":q" exit
	alias replasma "killall plasmashell && kstart5 plasmashell"
	alias i3rc "nvim ~/.config/i3/config"
	alias kurobarc "nvim ~/.config/i3/kurobar.sh"
	alias jmdmenurc "sudo -E nvim /usr/bin/jmdmenu"
	alias ghosttyrc "nvim ~/.config/ghostty/config"
	alias alattyrc "nvim ~/.config/alacritty/alacritty.toml"
	alias suv "sudo -E nvim"
	alias ffrc "nvim ~/.config/fastfetch/config.jsonc"
	alias cfr "java -jar /usr/bin/cfr.jar"
	alias py "python"
	alias drumz "drumseq ch ch h ch s ch h s -x -bpm=360"
    alias dashbd-clock "tty-clock -s -c -C 1"
    alias trexa "exa --tree --level=2 --icons"
    alias tl trexa
    alias swayrc "nvim ~/.config/sway/config"
    alias ql qalc
    alias rofi_ty1 "~/.config/rofi/launchers/type-1/launcher.sh"
    alias tmuxrc "nvim ~/.tmux.conf"
    # yes, i truly am *this* lazy btw
    alias mkx makex
    alias ts tailscale
    alias md mkdir
    alias arc aerc
    alias arcarc "nvim ~/.config/aerc/aerc.conf"
    alias apacherc "sudo -E nvim /etc/httpd/conf/httpd.conf"
    alias cgitrc "sudo -E nvim /etc/cgitrc"
    alias inspirc "sudo -E nvim /etc/inspircd/inspircd.conf"
    alias wzrc "nvim ~/.wezterm.lua"
    alias kittyrc "nvim ~/.config/kitty/kitty.conf"
    alias srm "sudo rm"
    alias safexvnc "x11vnc -rfbauth ~/.vnc/passwd -localhost -noxdamage -nowf -noscr -xkb -repeat -shared"
    alias svcs "systemctl list-units --type=service --state=running"
    alias wlanPwrSaveOn "sudo iw dev wlan0 set power_save on"
    alias wlanPwrSaveOff "sudo iw dev wlan0 set power_save off"
    alias cpuPwrSaveOn "sudo cpupower frequency-set -g powersave"
    alias cpuPwrSaveOff "sudo cpupower frequency-set -g schedutil"
    # AVD
    set -x ANDROID_HOME /opt/android-sdk
    set -x PATH $PATH $ANDROID_HOME/emulator $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools
end

