#/bin/bash

echo '   copying'
echo $1 | xclip -sel clip  && sleep 0.5; echo "    copied: $1" && exit 0
echo "   copy failed" && exit 1
