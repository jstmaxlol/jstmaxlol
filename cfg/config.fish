# note for the github repo:
# i update this cfg kinda very often so dont expect this to be always *always* up to date.

# ~/.config/fish/config.fish
if status is-interactive
	#other env vars
	set -x EDITOR vim
	set -x WINEPREFIX ~/winestuff/ps2018
	set -x WINEARCH win64
	# aliases because i am a [NOTHING BAD I SWEAR]
	alias nv nvim
	alias v nvim	#slowly converting to nvim, even tho syntax
					#       highlighting sucks ass (vim on top)
          #       probably a skill issue because *plugins*
	alias ff fastfetch
	alias fshsrc "source ~/.config/fish/config.fish"
	alias vimrc "vim ~/.vimrc"
	alias fishrc "v ~/.config/fish/config.fish"
	alias vfishrc "vim ~/.config/fish/config.fish"
	alias nvimrc "nvim ~/config/nvim/init.vim"
	# locale fucked - fix:
	#set -x LANG en_US.UTF-08
	#set -x LC_ALL en_US.UTF-08
end
