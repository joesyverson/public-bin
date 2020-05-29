#/bin/bash

echo && echo '   copying'
echo $@ | xclip -sel clipboard  && sleep 0.5; echo "    copied: $@" && echo && exit 0
echo "   copy failed" && echo && exit 1
