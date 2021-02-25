#######################
#		      #
# Usf keyboard layout #
# Custom Key Bindings #
#		      #
#######################
# clear caps lock if enabled
xmodmap -e "clear lock"
# set tilde as caps_lock
xmodmap -e "keycode 49 = Caps_Lock"
# set escape as tilde
xmodmap -e "keycode 9 = grave asciitilde" 
# set caps_lock as escape
xmodmap -e "keysym Caps_Lock = Escape"
