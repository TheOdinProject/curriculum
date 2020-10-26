#!/usr/bin/env bash
#
# Usage: bin/heroku_deploy

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NO_COLOR='\033[0m'

set -euo pipefail

schema_version=$(bin/rails db:version | { grep "^Current version: [0-9]\\+$" || true; } | tr -s ' ' | cut -d ' ' -f3)

if [ -z "$schema_version" ]; then
  printf "💀${RED}   [Release Phase]: Database schema version could not be determined. Does the database exist?${NO_COLOR}\n"
  exit 1
fi

if [ "$schema_version" -eq "0" ]; then
  printf "\n⏳${YELLOW}   [Release Phase]: Loading the database schema.${NO_COLOR}\n"
  bin/rails db:schema:load
else
  printf "\n⏳${YELLOW}   [Release Phase]: Running database migrations.${NO_COLOR}\n"
  bin/rails db:migrate
fi

printf "\n🎉${GREEN}   [Release Phase]: Database is up to date.${NO_COLOR}\n"