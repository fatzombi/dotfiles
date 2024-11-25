#!/bin/sh

if [[ "$(uname)" != "Darwin" ]]; then
  echo "Error: This script can only run on mac OS."
  exit 1
fi

echo "Killing DNS..."
sudo killall -HUP mDNSResponder
