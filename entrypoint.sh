# entrypoint.sh
#!/bin/bash

# Copy files to /home/ if they exist in /init_files
cp -r /init_files/* /home/ || true

# Start the default entrypoint command
exec "$@"
