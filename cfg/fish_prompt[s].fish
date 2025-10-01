function fish_prompt
    set -l user $USER
    set -l cwd $PWD
    set -l home $HOME

    if test "$cwd" = "$home"
		# if in ~
        echo -e (set_color white)"╭"(set_color red)"("(set_color white)"$user" \
				(set_color red)"⮞"(set_color white)"⮞"(set_color red)"⮞" \
				(set_color white)"~"(set_color red)")"(set_color red)"\n╰"(set_color normal)"⮞ "
		# ╭(max⮞⮞⮞~)
		# ╰⮞
    else if string match -q "$home/*" $cwd
        set -l relative (string replace "$home/" "~/" $cwd)
		# if in a ~ subdir
        echo -e (set_color white)"╭"(set_color red)"("(set_color white)"$user" \
				(set_color red)"⮞"(set_color white)"⮞"(set_color red)"⮞" \
				(set_color white)$relative(set_color red)")"(set_color red)"\n╰"(set_color normal)"⮞ "
    else
		# if in any other dir
        echo -e (set_color white)"╭"(set_color red)"("(set_color white)"$user" \
				(set_color red)"⮞"(set_color white)"⮞"(set_color red)"⮞" \
				(set_color white)$cwd(set_color red)")"(set_color red)"\n╰"(set_color normal)"⮞ "
    end
end
