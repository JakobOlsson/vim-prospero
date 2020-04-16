#!/usr/bin/env bash
# This is to setup ssh keys so they pass phrase is stored in in keychain store on macosx

if [[ $# -ne 1 ]]; then
  echo "run: $0 <name of your key>"
else
  # add your key to keychain
  ssh-add -K ~/.ssh/$1
  # update ssh config
  cat <<EOF >> ~/.ssh/config
Host *
  UseKeychain yes
  AddKeysToAgent yes
  IdentityFile ~/.ssh/$1
EOF
fi
