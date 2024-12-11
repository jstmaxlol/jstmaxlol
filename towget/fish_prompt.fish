function fish_prompt
    if test "$PWD" = "/home/maxlol"
      echo -e (set_color green)$USER(set_color white)"@"(set_color green)"~"\n(set_color white)":: "
    else
      echo -e (set_color green)$USER(set_color white)"@"(set_color green)$PWD\n(set_color white)":: "
    end
end
