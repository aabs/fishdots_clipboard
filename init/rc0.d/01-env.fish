if test -e /dev/clipboard
    set -U $FD_CLIPBOARD /dev/clipboard
else if test -e /dev/clip
        set -U $FD_CLIPBOARD /dev/clip
end