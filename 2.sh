#!/bin/bash

# Проверяем, что передано ровно одно число
if [ "$#" -ne 1 ]; then
    echo "An incorrect number of parameters was passed. Need: $0 число"
    exit 1
fi

# Проверяем, что передано число
if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "$1 - not a number"
    exit 1
fi

# Передали 0
if  [[ $1 -eq 0 ]]; then
	echo "multiply = 0"
	echo "sum = 0"
    exit 0
fi

number=$1
middle=$((number / 2))
multiply=1
sum=0

# Умножение
for ((i = 1; i <= middle; i++)); do
    multiply=$((multiply * i))
done

#Сумма
for ((i = middle + 1; i <= number; i++)); do
    if [ $((number % 2)) -eq 1 ] && [ "$i" -eq "$middle" ]; then
        continue
    fi
    sum=$((sum + i))
done

echo "multiply = $multiply"
echo "sum = $sum"