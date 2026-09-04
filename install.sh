#!/usr/bin/env bash

# HAPROXY

set -euo pipefail

# Download package
curl -L https://github.com/teguhraisrahmadi/haproxy/archive/refs/heads/main.tar.gz | tar -xz

# Change directory name
mv haproxy-main haproxy
