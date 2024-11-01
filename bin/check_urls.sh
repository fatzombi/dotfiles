#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <input_file> <output_file>"
  exit 1
fi

# Assign input and output file names from the parameters
input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Input file '$input_file' does not exist."
  exit 1
fi

# Clear the output file if it already exists
> "$output_file"

# Read URLs from the input file
while IFS= read -r url; do
  # Skip empty lines
  if [ -z "$url" ]; then
    continue
  fi
  # Use curl to check the URL and get the HTTP status code
  status_code=$(curl -o /dev/null -s -w "%{http_code}" -- "$url" || echo "error")
  
  # Check if the status code indicates the URL is online (status code 200)
  if [ "$status_code" = "200" ]; then
    # If the URL is online, write it to the output file
    echo "$url" >> "$output_file"
  fi
done < "$input_file"

echo "Online URLs have been saved to $output_file."
