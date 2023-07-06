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

if [ -f "$HOME/.sysadmin-scripts-installed" ] ; then
    rm -rf $HOME/__*.sh \
    && git clone --depth 1 https://github.com/petecooper/sysadmin-scripts.git $HOME/sysadmin-scripts/ &> /dev/null \
    && mv $HOME/sysadmin-scripts/*.sh $HOME \
    && rm -rf $HOME/sysadmin-scripts \
    && echo -e '`sysadmin-scripts` updated.'
fi

if [ -f "/usr/bin/free" ] ; then
    free -h
fi

if [ -f "/usr/bin/duf" ] ; then
    duf --only local --only-fs ext4,xfs --output mountpoint,size,used,avail,usage --width 115
fi

if [  -f "/swapfile" ] ; then
    echo -e '[\xE2\x9C\x94] Swapfile ready.' ; else
    echo -e '*************************\n* [\xE2\x9C\x98] Swapfile missing! *\n*************************' ;
fi
