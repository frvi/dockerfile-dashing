#!/bin/bash

function install_dependencies() {
  echo -e "\nAdding json,tzinfo, thin... explicit dependency on Gemfile."
  echo -e "\ngem 'json'" >> Gemfile
  echo -e "\ngem 'thin'" >> Gemfile
  echo -e "\ngem 'tzinfo-data', platforms: [:x64_mingw, :mingw, :mswin]" >> Gemfile
  echo -e "\n done..."
}

function install_widgets() {
  WIDGETS=$@
  if [[ ! -z "$WIDGETS" ]]; then
    for WIDGET in $WIDGETS; do
      echo -e "\nInstalling widget from gist $WIDGET"
      smashing install "$WIDGET"
    done
  fi
}

function install_gems() {
  GEMS=$@
  if [[ ! -z "$GEMS" ]]; then
    echo -e "\nInstalling gem(s): $GEMS"
    for GEM in $GEMS; do
      echo -e "\ngem '$GEM'" >> Gemfile
    done
    bundle install
  fi
}

if [[ ! -e /installed ]]; then
  install_dependencies
  install_widgets $WIDGETS
  install_gems $GEMS
  touch /installed
fi

if [[ ! -z "$PORT" ]]; then
  PORT_ARG="-p $PORT"
fi

# Start smashing
echo -e "\n Starting ..."
exec smashing start $PORT_ARG

