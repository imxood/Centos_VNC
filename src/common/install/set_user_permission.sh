#!/usr/bin/env bash
### every exit != 0 fails the script
set e
find $HOME/ -name '*.sh' -exec chmod -v a+x {} + 
find $HOME/ -name '*.desktop' -exec chmod -v a+x {} +
chgrp -R 0 $HOME && chmod -R a+rw $HOME && find $HOME -type d -exec chmod -v a+x {} +