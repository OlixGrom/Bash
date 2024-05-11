#!/bin/bash

#Проверили переданные опции 
VALID_ARGS=$(getopt -o f:e:r: --long file:,extension:,replacement: -- "$@")
if [[ $? -ne 0 ]]; then
    exit 1;
fi

eval set -- "$VALID_ARGS"

files=()
replacement=""
extensions=""

i=0

while [ : ]; 
do
  ((i+=1))

  case "$1" in
    -f | --file)
      files+=$2
      shift 2
      ;;
    -e | --extension)
      extensions=$2
      shift 2
      ;;
    -r | --replacement)
      replacement=$2
      shift 2
      ;;
  esac
  
  [ $i -gt $# ] && break
done

rename() {
 for file in $files;
  do
    if [ ! -f $file ]; then
       echo "File $file not found"
       exit 1
    fi
    
    mv -- "$file" "${file%.$extensions}.$replacement"
  done
}

rename