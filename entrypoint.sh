#!/bin/sh
# Add an entry to /etc/hosts to resolve the "vault" hostname
echo "127.0.0.1 vault" >> /etc/hosts
# Run the command passed to the Docker CMD
exec "$@"

