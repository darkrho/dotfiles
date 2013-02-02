#!/bin/bash
#
# Author: Rolando Espinoza La fuente <darkrho (at) gmail.com>
#

function git_bundle() {
  repo=$1
  name=$(echo "$repo"|egrep -o '([^/]+).git$'|cut -d. -f1)
  if [ -z "$name" ]; then
    echo "Can't recognize git repository name: $repo"
    exit 1
  fi
  if [ -d $name ]; then
    msg Updating $name
    (cd $name; git pull)
  else
    msg Installing $name
    git clone $repo $name
  fi
}

function msg() {
  echo "->" $@
}

