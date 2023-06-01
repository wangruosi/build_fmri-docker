#!/bin/bash

set -e

if [ $# -gt 0 ]; then
    exec "$@"
else
    jupyter lab /workspace --ip=0.0.0.0 --allow-root --no-browser
fi
