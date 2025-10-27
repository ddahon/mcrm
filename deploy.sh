#!/bin/bash

su - mcrm -c "cd mcrm && git pull"
cd /home/mcrm/mcrm && docker build . -t mcrm
docker stop mcrm && docker rm mcrm
docker run -d --name mcrm -p 8081:4000 --env-file /home/mcrm/mcrm/.env mcrm
docker exec mcrm /app/bin/migrate