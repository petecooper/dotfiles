if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -f "/usr/bin/free" ] ; then
    free -h
fi

if [ -f "/usr/bin/duf" ] ; then
    duf --only local --only-fs ext4 --output mountpoint,size,used,avail,usage
fi

if [  -f "/swapfile" ] ; then
    echo -e '[\xE2\x9C\x94] Swapfile ready.' ; else
    echo -e '**********************\n[\xE2\x9C\x98] Swapfile missing!\n**********************' ;
fi
