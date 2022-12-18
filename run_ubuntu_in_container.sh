#!/bin/bash

# removing if container exists:
docker rm -f my_container

# running container and binding src folder (-v flag), so all inside src is inside src in container
docker run -d -it -p 9999:80 -v /$(pwd)/src/:/src/ --name my_container ubuntu:20.04

# entering container, so we can execute commands:
docker exec -it my_container bash