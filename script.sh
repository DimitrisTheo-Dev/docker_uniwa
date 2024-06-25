#!/bin/bash

build_services() {
    printf "Building Docker services...\n"
    docker-compose build
    # Check if the docker-compose command was successful
    if [ $? -eq 0 ]; then
        printf "Docker services have been build successful.\n"
    else
        printf "Error: Unable to build Docker services.\n"
        exit 1
    fi
}

launch_services() {
    printf "Launching Docker services...\n"
    docker-compose up
    if [ $? -eq 0 ]; then
        printf "Docker services launched successfully.\n"
    else
        printf "Error: Unable to launch Docker services.\n"
        exit 1
    fi
}

terminate_services() {
    printf "Terminating Docker services...\n"
    docker-compose down
    if [ $? -eq 0 ]; then
        printf "Docker services terminated successfully.\n"
    else
        printf "Error: Unable to terminate Docker services.\n"
        exit 1
    fi
}


display_option() {
    printf "Options:\n 1. launch \n 2. reload \n 3.terminate\n"
    exit 1
}

case "$1" in
    launch)
      build_services
      launch_services
      ;;
    reload)
        terminate_services
        build_services
        launch_services
        ;;
    terminate) terminate_services ;;
    *)         display_option ;;
esac
