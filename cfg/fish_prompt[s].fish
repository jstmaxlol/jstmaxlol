# fish_prompt
function fish_prompt
    set -l user $USER
    set -l cwd $PWD
    set -l home $HOME

    if test "$cwd" = "$home"
                # if in ~
        echo -e (set_color red)"("(set_color white)"$user" \
                                (set_color red)"⮞"(set_color white)"⮞"(set_color red)"⮞" \
                                (set_color white)"~"(set_color red)")"(set_color normal)"\n⮞ "
                # (max⮞⮞⮞~)
                # ⮞
    else if string match -q "$home/*" $cwd
        set -l relative (string replace "$home/" "~/" $cwd)
                # if in a ~ subdir
        echo -e (set_color red)"("(set_color white)"$user" \
                            (set_color red)"⮞"(set_color white)"⮞"(set_color red)"⮞" \
                                (set_color white)$relative(set_color red)")"(set_color normal)"\n⮞ "
    else
                # if in any other dir
        echo -e (set_color red)"("(set_color white)"$user" \
                                (set_color red)"⮞"(set_color white)"⮞"(set_color red)"⮞" \
                                (set_color white)$cwd(set_color red)")"(set_color normal)"\n⮞ "
    end
end

# fish_right_prompt
function fish_right_prompt
    set last_status $status

    # check for which color to use
    if test $last_status -eq 0
        set color white
    else
        set color red
    end

        if test $color = "white"
                set colorInverse red
        else
                set color white
        end

        # set date in dt
        set dt $(date '+%Y-%m-%d %H:%M')

        # print prompt
    echo -e (set_color $colorInverse)"( "(set_color $color)"$last_status"(set_color $colorInverse)" | "(set_color $color)"$dt"(set_color $colorInverse)" )"
end
