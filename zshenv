# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ADT
export PATH=~/bin/adt-sdk/platform-tools:~/bin/adt-sdk/platforms:~/bin/adt-sdk/tools:$PATH

# depot_tools (for chromium builds)
export PATH="$PATH":~/bin/depot_tools
