#!/bin/bash

# Проверка наличия аргументов
if [ "$#" -ne 4 ]; then
    echo "An incorrect number of parameters was passed. Need:<file> <search>"
    exit 1
fi

file=""
search=""

while [[ $# -gt 0 ]]; 
do
  case "$1" in
    -f | --file)
      file=$2
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
echo "$search $file"
count=$(grep -c "$search" "$file")

#Результат
if [ "$count" -gt 0 ]; then
    echo "The number of matches found: $count"
else
    echo "Not a single match of the word $search was found in the file $(realpath "$file")"
fi