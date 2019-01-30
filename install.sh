#!/bin/bash

function fetch_files {
  for f in $@; do
    dir=`dirname $f`
    if [[ $dir != '.' ]]; then
      if [[ ! -d $dir ]]; then
        mkdir $dir
      fi
      pushd $dir > /dev/null
      curl -Ls -O $GITPATH/$f
      popd > /dev/null
    else
      curl -Ls -O $GITPATH/$f
    fi
    echo "download file $f"
  done
}

source ./file.conf

GITPATH=https://github.com/rime/rime-stroke/raw/master
fetch_files $stroke_files

GITPATH=https://github.com/rime/rime-wubi/raw/master
fetch_files $wubi86_files

GITPATH=https://github.com/rime/rime-double-pinyin/raw/master
fetch_files $double_pinyin_files

GITPATH=https://github.com/rime/rime-emoji/raw/master
fetch_files $emoji_files
