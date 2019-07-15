#!/bin/sh
set -euf

# TODO: reconcile this with ansible-install.yml

cd $(dirname $0)
stow -R $(find -maxdepth 1 -type d  -not -name '.*' | sed 's!^./!!')
