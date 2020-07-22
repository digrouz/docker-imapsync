#!/usr/bin/env bash
 
. /etc/profile
. /usr/local/bin/docker-entrypoint-functions.sh

MYUSER="${APPUSER}"
MYUID="${APPUID}"
MYGID="${APPGID}"

ConfigureUser
AutoUpgrade

if [ "$1" = 'imapsync' ]; then
  RunDropletEntrypoint
  DockLog "Starting app: ${@}"
  exec su-exec "${MYUSER}" imapsync
else
  DockLog "Starting command: ${@}"
  exec "$@"
fi
