#!/bin/bash
BASE_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$BASE_DIR/build-settings/set-project-env.sh"
"$SOURCE_DIR/build-env/$IDE_SCRIPT" $START_UBUNTU_IDE
