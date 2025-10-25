function fish_greeting
    if not set -q fish_greeting
        set -l line1 (printf (_ 'well-cum to %sfiš%s, the %sevil%s šell!') (set_color red) (set_color normal) (set_color red) (set_color normal))
        set -l line2 \n(printf (_ 'type %snvim%s to use a good text editor.') (set_color red) (set_color normal))
        set -g fish_greeting "$line1$line2"
    end

    if set -q fish_private_mode
        set -l line (_ "fiš is running in private mode, historia will perish upon closure.")
        if set -q fish_greeting[1]
            set -g fish_greeting $fish_greeting\n$line
        else
            set -g fish_greeting $line
        end
    end

    test -n "$fish_greeting"
    and echo $fish_greeting
    task # show tasks
end
