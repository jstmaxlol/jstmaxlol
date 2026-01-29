# how to do scheiße
basically:
- `fastfetch_config.jsonc` -> the general ff config
- `ii/` -> the folder for the custom ascii logos
- `ii/*.txt` -> the custom ascii logos
- `?.sh` -> a utility script that rotates between each logo \
            i recommend removing the `.sh` from the name and inserting \
            it into your `$PATH` either in place of fastfetch or as \
            an alias-ish.. thingy.. something. :)

## about the logos
it's generally public domain (ish) images of philosophers, theorists and politicians \
i either like, love, find haha, interesting, i dont even know.
for know (this list ,, i wont update ,, i think anyway)
- mikhail bakunin (`bakiscii`) -> big anarchist theorist generally. should i add kropotkin too?
- enrico berlinguer (`enriscii`) -> best communist leader (PCI secretary during the 70s) in italy ngl
- carlo cafiero (`cafiscii1` & `cafiscii2`) -> italian philosopher, original translator of \
  marx's 'das kapital' in italian --- anarchist
- mao tse-tung (`maoscii`) -> do i really need to explain who mao was?
- karl marx (`marscii`) -> same as mao.. do i really need to say who karl fucking marx was?
thanks for coming to my ted talk, i hope to never update this readme


note: the general command i used to generate these is;
```
img2txt -W 42 -H 22 /path/to/photo.jpeg -f ansi -d none -g 0.3 > hahaName.txt
```

