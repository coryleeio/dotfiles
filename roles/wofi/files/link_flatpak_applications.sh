#!/usr/bin/env bash

if ! test -d $1; then
  echo "1st arguement should be a directory that exists.  It should be your steam Desktop directory. Directory does not exist.";
  exit 1;
fi

# Link them in a directory under XDG_DATA_DIRS so wofi can see them
find $1 -name '*.desktop' -exec ln -sv "{}" ~/.local/share/applications/ \;

# Find the icons and link them as well
for Item in $(ls "${1}/icons/hicolor/");
do
  targ="${1}/icons/hicolor/${Item}/apps";
  find "${targ}" -name "*.png*" -exec ln -sv "{}" ~/.local/share/icons/hicolor/${Item}/apps/ \;
done