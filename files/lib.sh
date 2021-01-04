# die caps_lock die

_kill_caps_lock ()
{
    dumpkeys |
        sed '1d' |
        sed 's/Caps_Lock/Control/' |
        sudo loadkeys
}

unset setup_keymap
setup_keymap ()
{
    if test -f /etc/alpine-release; then
        for pkg in kbd kbd-legacy; do
            apk info --quiet --installed $pkg ||
                sudo apk add $pkg
        done
        sudo loadkeys /usr/share/keymaps/legacy/i386/qwerty/uk.map.gz
        _kill_caps_lock
    elif test -f /etc/debian_version; then
        dpkg -s console-data >/dev/null || 
		sudo apt-get install console-data &&
			{
				if test "$1" = "uk"; then
					sudo loadkeys /usr/share/keymaps/i386/qwerty/uk.kmap.gz
				else
					sudo loadkeys /usr/share/keymaps/i386/qwertz/de-latin1-nodeadkeys.kmap.gz
				fi
			}
        _kill_caps_lock
    else
        echo "os not recognized"
    fi
}
export -f setup_keymap
