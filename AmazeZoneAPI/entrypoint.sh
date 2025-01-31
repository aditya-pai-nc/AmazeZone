#!/bin/sh

# Remove the server.pid file if it exists
rm -f /app/tmp/pids/server.pid

# Start the Rails server
exec "$@"
