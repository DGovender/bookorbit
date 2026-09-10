#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f server/.env ]]; then
  cp server/.env.example server/.env
fi

sed -i 's#@localhost:5432/#@db:5432/#' server/.env

corepack enable
pnpm install --frozen-lockfile
pnpm run db:migrate
pnpm run db:seed
