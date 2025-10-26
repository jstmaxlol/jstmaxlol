function fish_right_prompt
    set last_status $status
    
    # check for which color to use
    if test $last_status -eq 0
        set color white
    else
        set color red
    end

    # set inverse color
	if test $color = "white"
		set colorInverse red
	else
		set color white
	end

	# set date in dt
	set dt $(date '+%Y-%m-%d %H:%M')

    # set battery capacity in bat
    set bat $(cat /sys/class/power_supply/BAT0/capacity)

	# print prompt
    echo -e (set_color $colorInverse)"( "(set_color $color)"$last_status"(set_color $colorInverse)" | " \
            (set_color $color)"bat.$bat%"(set_color $colorInverse) " | " \
		    (set_color $color)"$dt"(set_color $colorInverse)" )"
end
