# ~/.config/fish/config.fish
if status is-interactive

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

end
