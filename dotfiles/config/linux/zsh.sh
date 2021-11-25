export PATH=/home/linuxbrew/.linuxbrew/bin/:$PATH

# map caps lock to hyper character, escape is an alternative
setxkbmap -option caps:hyper
# update autorepeat, so it's faster
xset r rate 300 50

# linuxbrew shell setup
eval "$(brew shellenv)"

