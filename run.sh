#!/bin/bash

shift 1

# Pass a list of dashing widgets (i.e. gist IDs) as an argument to run.sh
# If no arguments are supplied the default widgets "hotness" and "randow-aww"
# are installed:
#  - Fork of Hotness: https://gist.github.com/munkius/9209839
#  - Random Aww plugin: https://gist.github.com/chelsea/5641535
GISTS=${*:-"9209839 5641535"}

# Install widgets
if [[ ! -z "$GISTS" ]]; then
  for GIST in $GISTS; do
    echo -e "\nInstalling widget from gist $GIST"
    dashing install "$GIST"
  done
fi

# Start dashing
exec dashing start

