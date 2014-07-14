#!/bin/bash

# Install widgets
if [[ ! -z "$WIDGETS" ]]; then
  for WIDGET in $WIDGETS; do
    echo -e "\nInstalling widget from gist $WIDGET"
    dashing install "$WIDGET"
  done
fi

# Install gems (e g widget dependencies)
if [[ ! -z "$GEMS" ]]; then
  echo -e "\nInstalling gem(s) $GEMS"
  echo "" >> Gemfile
  for GEM in $GEMS; do
    echo "gem '$GEM'" >> Gemfile
  done
  bundle install
fi

# Start dashing
exec dashing start

