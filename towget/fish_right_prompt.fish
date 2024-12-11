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
