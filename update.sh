/usr/local/bin/docker-compose -f /home/ubuntu/projects/kgc/docker-compose.yml run worker | awk '{print strftime("%c: %"), $0; fflush();}'
