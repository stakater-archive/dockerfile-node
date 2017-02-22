#!/bin/bash
set -e

# Add node as command if needed
if [ "${COMMAND:0:1}" = '-' ]; then
	set -- stakater "$COMMAND"
fi

# Drop root privileges if we are running node
# allow the container to be started with `--user`
if [ "$COMMAND" = 'node' -a "$(id -u)" = '0' ]; then
	set -- su-exec stakater "$COMMAND"
fi

# As argument is not related to node,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$COMMAND"