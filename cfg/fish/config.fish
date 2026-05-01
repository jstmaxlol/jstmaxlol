# ~/.config/fish/config.fish
if status is-interactive

	# ENVIRONMENT VARIABLES
	set -x EDITOR nvim
	set -x VISUAL nvim
	set -x TERMINAL alacritty
	set -x VIMRUNTIME "/usr/share/nvim/runtime"
    #set -x WINEPREFIX ~/winestuff/ps2018
	set -x WINEARCH win64
    set -x ANDROID_HOME /opt/android-sdk
    set -x PATH $ANDROID_HOME/cmdline-tools/latest/bin $PATH
    set -x PATH $ANDROID_HOME/platform-tools $PATH
    #
    export GTK_IM_MODULE=ibus
    export QT_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus

    # keychain
    keychain id_ed25519
    keychain D9B423C43C7416D7
    source ~/.keychain/(hostname)-fish
    
    #set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

    function fuck -d "correct your previous console command"
        set -l fucked_up_command $history[1]
        env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
        if [ "$unfucked_command" != "" ]
            eval $unfucked_command
            builtin history delete --exact --case-sensitive -- $fucked_up_command
            builtin history merge
        end
    end

	# ALIASES
	alias v nvim
    alias b bat
	alias ff fastfetch
	alias nf nfetch
    alias lg lazygit
    alias irs irssi
    alias irc irs
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
    alias secsz aarch64-linux-gnu-size
	alias drumz "drumseq ch ch h ch s ch h s -x -bpm=360"
    alias dashbd-clock "tty-clock -s -c -C 1"
    alias trexa "exa --tree --level=2 --icons"
    alias tl trexa
    alias swayrc "nvim ~/.config/sway/config"
    # yes, i truly am *this* lazy btw
    alias ql qalc
    alias rofi_ty1 "~/.config/rofi/launchers/type-1/launcher.sh"
    alias tmuxrc "nvim ~/.tmux.conf"
    # trashcan
        alias t trash
        alias trm trash-put
        alias tget trash-restore
        alias tempty trash-empty
        alias tem tempty
        alias tlist trash-list
        alias th tlist
        alias tls tlist
    # endoftrash
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
    alias krc kittyrc
    alias srm "sudo -E rm"
    alias safexvnc "x11vnc -rfbauth ~/.vnc/passwd -localhost -noxdamage -nowf -noscr -xkb -repeat -shared"
    alias svcs "systemctl list-units --type=service --state=running"
    alias wlanPwrSaveOn "sudo -E iw dev wlan0 set power_save on"
    alias wlanPwrSaveOff "sudo -E iw dev wlan0 set power_save off"
    alias cpuPwrSaveOn "sudo -E cpupower frequency-set -g powersave"
    alias cpuPwrSaveOff "sudo -E cpupower frequency-set -g performance"
    # sudo systemctl * {
        alias starts "sudo -E systemctl start"
        alias ustarts "systemctl --user start"

        alias stops "sudo -E systemctl stop"
        alias ustops "systemctl --user stop"

        alias reloads "sudo -E systemctl reload"
        alias ureloads "systemctl --user reload"

        alias restarts "sudo -E systemctl restart"
        alias urestarts "systemctl --user restart"

        alias statuses "sudo -E systemctl status"
        alias ustatuses "systemctl --user status"

        alias enables "sudo -E systemctl enable"
        alias uenables "systemctl --user enable"

        alias disables "sudo -E systemctl disable"
        alias udisables "systemctl --user disable"

        alias edits "sudo -E systemctl edit"
        alias uedits "systemctl --user edit"
    # }
    alias tsf "tailscale funnel"
    alias finf "cpupower frequency-info"
    alias fset "sudo cpupower frequency-set -u"
    alias xcp "xclip -selection clipboard"
    alias tmx tmux
    alias bye "systemctl poweroff"
    alias bah-bye "bye"
    alias ":C" clear
    alias why witr
    alias dusg "sudo du -xh / --max-depth=1 2>/dev/null | sort -h"
    alias mk make
    alias nmc 'nmcli -p'
    alias vib 'busybox vi'
    alias gitweb 'git instaweb --httpd=webrick'
    alias doscc 'x86_64-w64-mingw32-cc'
    alias whatson 'sudo lsof -i'
    alias m make
    alias grubrc 'sudo -E nvim /etc/default/grub'
    alias regrub 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
    alias em 'emacs -nw'
    alias a2c 'aria2c -x 16 -s 16 -k 1M -c'
    alias a2d 'aria2c --enable-rpc'
    alias sign 'gpg --sign'
    alias detach-sign 'gpg --detach-sign'
    alias cacafire_term 'DISPLAY= cacafire'
    alias startkmx 'sudo kmscon --login --no-switchvt --drm --mouse --hwaccel --xkb-layout=us --font-name=Iosevka --font-size=16 --xkb-options=caps:escape,compose:ralt --font-antialiasing=full --vt'

end

