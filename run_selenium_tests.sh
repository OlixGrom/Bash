#!/bin/bash

# Проверка наличия аргументов
if [ "$#" -ne 6 ]; then
    echo "An incorrect number of parameters was passed. Need: $0 <URL> <browser_name> <browser_version>"
    exit 1
fi

stand_url=""
browser_name=""
browser_version=""
remote_url="http://193.104.57.173/wd/hub"

# Обработка аргументов командной строки
while [[ $# -gt 0 ]]; do
    case "$1" in
        -u | --url)
            stand_url=("$2")
            shift 2
            ;;
        -b | --browser)
            browser_name="$2"
            shift 2
            ;;
        -v | --version)
            browser_version="$2"
            shift 2
            ;;
        *)
            echo "Unknown parametr: $1"
            exit 1
            ;;
    esac
done


# Запуск тестов на Selenium Grid через селеноид
mvn clean test "-Dbase.url=$stand_url" "-Dbrowser=$browser_name" "-Dbrowser.version=$browser_version" "-Dremote.url=$remote_url"

# Проверка статуса
if [ $? -ne 0 ]; then
    echo "Error: The tests could not be completed."
    exit 1
fi

echo "The tests were completed successfully."
exit 0