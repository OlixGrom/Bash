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
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -e SELENIUM_GRID_URL=http://localhost:4444/wd/hub -e BROWSER="$browser_name" -e BROWSER_VERSION="$browser_version" -e TEST_URL="$stand_url" aerokube/selenoid:latest-release start-session