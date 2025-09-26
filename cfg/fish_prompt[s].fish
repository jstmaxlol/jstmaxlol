# fish_prompt
function fish_prompt
    set -l user (set_color green)$USER(set_color white)"@"
    set -l cwd $PWD
    set -l home $HOME

    if test "$cwd" = "$home"
        echo -e (set_color white)"("(set_color green)"$user"(set_color magenta)"~"(set_color white)")"(set_color normal)"\n⮞ "
    else if string match -q "$home/*" $cwd
        set -l relative (string replace "$home/" "~/" $cwd)
        echo -e (set_color white)"("(set_color green)"$user"(set_color magenta)$relative(set_color white)")"(set_color normal)"\n⮞ "
        #echo -e "$user"(set_color green)$relative(set_color white)" => "
    else
        echo -e "$user"(set_color green)$cwd(set_color white)" => "
    end
end

# fish_right_prompt
function fish_right_prompt
    set last_status $status

    # check for which color to use
    if test $last_status -eq 0
        set color green
    else
        set color red
    end

        # set date in dt
        set dt $(date '+%Y-%m-%d %H:%M')

        # print prompt
    echo -e (set_color white)"( "(set_color $color)"$last_status"(set_color white)" | "(set_color $color)"$dt"(set_color white)" )"
end
