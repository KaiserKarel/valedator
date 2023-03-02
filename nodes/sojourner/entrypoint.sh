#!/usr/bin/env bash

set -Eeuo pipefail

ccdecrypt --keyfile /secrets/keyfile --cat /secrets/priv_validator_key.json.cpt > ~/.mars/config/priv_validator_key.json 
cosmovisor start