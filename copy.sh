#/bin/bash

echo && echo '   copying'
echo "$1" | xclip -sel clip  && sleep 0.5; echo "    copied: $1" && echo && exit 0
echo "   copy failed" && echo && exit 1
