#!/bin/bash
set -e

# Add a user with the host user's UID and GID
useradd -u ${LOCAL_UID:-1000} -o -m user
export HOME=/home/user

# Run the specified command as the newly created user
exec /usr/sbin/gosu user "$@"
