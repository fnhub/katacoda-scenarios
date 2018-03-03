#!/usr/bin/env bash

echo "Installing Fn CLI tool."
curl -s -L https://github.com/fnproject/cli/releases/download/0.4.57/fn_linux -o fn
chmod +x fn > /dev/null
mv fn /usr/bin/fn > /dev/null
export FN_API_URL=http://docker:8080
clear
