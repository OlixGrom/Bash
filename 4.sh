#!/bin/bash

VALID_ARGS=$(getopt -o f:s: --long file:,search: -- "$@")
if [[ $? -ne 0 ]]; then
    exit 1;
fi

eval set -- "$VALID_ARGS"

files=()
search=""

while [[ $# -gt 0 ]]; 
do
  case "$1" in
    -f | --file)
      files=$2
      shift 2
      ;;
    -s | --search)
      search=$2
      shift 2
      ;;
  esac 
done

# Есть ли файл
if [ ! -f "$file" ]; then
    echo "File $file not found"
    exit 1
fi

#Ищем строку
count=$(grep -c "$search" "$file")

#Результат
if [ "$count" -gt 0 ]; then
    echo "The number of matches found: $matches"
else
    echo "Not a single match of the word $search was found in the file $(realpath "$file")"
fi