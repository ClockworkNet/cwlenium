#!/bin/bash

# Halt on error
set -e

# docker-compose down
echo "done"
echo ""
echo "Point your browser at http://localhost:4444/dashboard to review your testing status and videos for captured tests."
echo ""
echo "Press any key to shutdown zalenium."

# Wait for the anykey
read -n 1 -s

docker-compose down
