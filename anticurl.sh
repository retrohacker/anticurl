#!/usr/bin/env bash
trap cleanup INT

function cleanup() {
  rm -rf $tmp
}

tmp=.$BASHPID.download
curl -sL $1 > $tmp
"${EDITOR:-vi}" $tmp
chmod +x $tmp
sudo ./$tmp
rm -rf $tmp
cleanup
