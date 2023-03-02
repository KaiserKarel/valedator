#!/usr/bin/env bash

set -Eeuo pipefail

docker run -v /Users/k/valedator/secrets:/secrets -v /Users/k/valedator/data:/root/.mars/data --platform linux/x86_64 test 