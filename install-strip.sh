#!/bin/sh
# install-strip.sh: A script to strip the installed binary

# Check if the executable path was provided as an argument
if [ -z "$1" ]; then
  echo "Error: No executable path provided to the strip script."
  exit 1
fi

# Strip the provided executable
echo "Stripping the binary: $1"
strip "$1"

# Check if the strip command was successful
if [ $? -eq 0 ]; then
  echo "Stripping completed successfully."
else
  echo "Error: Stripping failed."
  exit 1
fi

