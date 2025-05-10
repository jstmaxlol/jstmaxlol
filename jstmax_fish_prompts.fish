# fish_prompt
function fish_prompt
    if test "$PWD" = "/home/max" # change max with your username :3
      echo -e (set_color green)$USER(set_color white)"@"(set_color green)"~"(set_color white)" :: "
    else
      echo -e (set_color green)$USER(set_color white)"@"(set_color green)$PWD(set_color white)" :: "
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
        echo -e (set_color $color)"[$last_status]"
end
