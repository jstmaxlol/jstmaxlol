# ~/.config/fish/config.fish
if status is-interactive
        # other env vars
        set -x EDITOR vim
        set -x WINEPREFIX ~/winestuff/ps2018
        set -x WINEARCH win64
        # aliases because i am a [NOTHING BAD I SWEAR]
        alias nv nvim
        alias v vim
        alias ff fastfetch
        alias nf nfetch
        alias fishsrc "source ~/.config/fish/config.fish"
        alias vimrc "vim ~/.vimrc"
        alias fishrc "vim ~/.config/fish/config.fish"
        alias neofishrc "nvim ~/.config/fish/config.fish"
        alias nvimrc "nvim ~/config/nvim/init.vim"
        alias ":q" exit
        # locale fucked - fix:
        #set -x LANG en_US.UTF-08
        #set -x LC_ALL en_US.UTF-08
end
	#set -x LANG en_US.UTF-08
	#set -x LC_ALL en_US.UTF-08
end
