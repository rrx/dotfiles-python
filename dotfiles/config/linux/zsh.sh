export PATH=/home/linuxbrew/.linuxbrew/bin/:$PATH

if [ -n "${DISPLAY+1}" ]; then
# map caps lock to hyper character, escape is an alternative
setxkbmap -option caps:hyper
# update autorepeat, so it's faster
xset r rate 300 50
fi


