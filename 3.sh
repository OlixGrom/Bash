#!/bin/bash

# Проверка наличия аргументов
if [ "$#" -ne 3 ]; then
    echo "An incorrect number of parameters was passed. Need: $0 <URL стенда> <имя браузера> <версия браузера>"
    exit 1
fi

# URL стенда
stand_url="$1"
# Имя браузера
browser_name="$2"
# Версия браузера
browser_version="$3"

# Запуск тестов на Selenium Grid через селеноид
docker run browser="$browser_name" -e browser.version="$browser_version" -e remote.url="$stand_url"

# Проверка статуса
if [ $? -ne 0 ]; then
    echo "Error: The tests could not be completed."
    exit 1
fi

echo "The tests were completed successfully."
exit 0