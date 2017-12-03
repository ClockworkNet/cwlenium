#!/bin/bash

docker-compose run backstopjs test

echo ""
echo "Visual regression tests complete"
echo "To view results run bin/view_report.sh"