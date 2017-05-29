#!/usr/bin/env bash

docker build -t costezki/stardog:latest  -t costezki/stardog:5-0-beta .

docker login

docker push costezki/stardog:latest
