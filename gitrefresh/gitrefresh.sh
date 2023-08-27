#!/usr/bin/env bash

set -o errexit
set -o pipefail

find . -maxdepth 3 -type d -name ".git" -execdir git pull \;
