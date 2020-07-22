#!/bin/bash
ls -l > ./list.txt
cat list.txt

docker build -f Dockerfile -t nginx:2.0 .
docker run -d -p 80:80 --name mynginx nginx:2.0



