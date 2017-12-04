#!/bin/bash

# Halt on error
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Starting Zalenium Grid"
${DIR}/start_zalenium.sh

echo ""
echo "Navigate your browser to http://localhost:4444/dashboard/ and wait for your tests to return"
echo ""
echo "Firing up cucumber and attaching to grid to execute tests"
echo ""

docker-compose run tester

echo "Stopping Zalenium Grid"
${DIR}/stop_zalenium.sh

echo "Generating visual regression reference files"
${DIR}/generate_backstop_references.sh

echo "Executing visual regression tests"
${DIR}/run_backstop_tests.sh