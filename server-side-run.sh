#!/usr/bin/env bash

docker pull costezki/stardog:latest

docker volume create --name stardog-data

docker run -d --name stardog -p 5820:5820 -v stardog-data:/data costezki/stardog:latest
