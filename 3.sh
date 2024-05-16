#!/bin/bash

# Проверка наличия аргументов
if [ "$#" -ne 6 ]; then
    echo "An incorrect number of parameters was passed. Need: $0 <URL> <browser_name> <browser_version>"
    exit 1
fi

# URL стенда
stand_url="$1"
# Имя браузера
browser_name="$2"
# Версия браузера
browser_version="$3"

# Запуск тестов на Selenium Grid через селеноид
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -e SELENIUM_GRID_URL=http://193.104.57.173:2222/wd/hub -e BROWSER="$browser_name" -e BROWSER_VERSION="$browser_version" -e TEST_URL="$stand_url" aerokube/selenoid:latest-release start-session

# Проверка статуса
if [ $? -ne 0 ]; then
    echo "Error: The tests could not be completed."
    exit 1
fi

echo "The tests were completed successfully."
exit 0