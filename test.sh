#!/bin/bash

set -e

echo "Starting Automated Tests..."

if [ ! -s index.html ]; then
    echo "FAIL: HTML file not found."
    exit 1
fi

echo "PASS: HTML file exists."

grep -q '<h1>Automated Testing in CI/CD</h1>' index.html
echo "PASS: Application heading verified."

grep -q 'Application is ready for deployment.' index.html
echo "PASS: Application status verified."

echo "All automated tests passed successfully!"