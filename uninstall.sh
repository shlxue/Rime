#!/bin/bash

function clear_files {
  for f in $@; do
    if [ -f $f ]; then
      rm $f
      echo "Removed file $f"
    fi
  done
}

source ./file.conf

clear_files $stroke_files
clear_files $wubi86_files
clear_files $double_pinyin_files
clear_files $emoji_files

# delete user folders and build folder
rm -fr *.userdb build
