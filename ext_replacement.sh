#!/bin/bash

files=()
replacement=""
extensions=""
i=0
# Обработка аргументов командной строки
while [[ $# -gt 0 ]]; do
    case "$1" in
        -f | --file)
            files+=("$2")
            shift 2
            ;;
        -e | --extension)
            extension="$2"
            shift 2
            ;;
        -r | --replacement)
            replacement="$2"
            shift 2
            ;;
        *)
            echo "Unknown parametr: $1"
            exit 1
            ;;
    esac
done

# Замена расширений файлов
rename() {
    
 for file in ${files[@]};do
    echo "Files ${files[@]}"
    if [ ! -f $file ]; then
       echo "File $file not found"
       exit 1
    fi

      mv -- "$file" "${file%.*}.$replacement"
      echo "${file%.*}.$replacement"
  done
}

rename