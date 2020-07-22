#!/bin/bash
ls -l > ./list.txt
cat list.txt

docker build -f Dockerfile -t nginx:1.1 .
docker run -d -p 80:80 --name mynginx nginx:1.1



