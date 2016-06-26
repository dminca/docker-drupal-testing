#!/bin/bash
# Wrapper script for the Makefile

SERVER_USER="nginx"

# Set folder permissions for /app
perms()
{
  egrep -i "^$SERVER_USER" /etc/passwd

  if [[ "$?" -ne 0 ]]; then
    sudo groupadd $SERVER_USER
    sudo useradd -g "$SERVER_USER" "$SERVER_USER"
  else
    sudo chown -R "$SERVER_USER":"$SERVER_USER" app/sites
    sudo chown "$SERVER_USER":"$SERVER_USER" app/themes
    sudo chown "$SERVER_USER":"$SERVER_USER" app/modules
  fi
}

"$@"
