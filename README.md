# gene.iobio.local
Locally installed gene.iobio

This repository contains scripts and config files for locally deploy gene.iobio on any docker-enabled servers

# Getting Started
To get started, you need to have a hostname assigned to your server so that both the server and the clients can resolve to the same ip address. This is because iobio applications make websocket connections to the underlying services running on the server, and the services themselves also make connections to other services. Hostnames such as 'localhost' has different meanings on the client, and in different service containers, making it unsuitable even for testing purpose.

Let's assume that the hostname is `gene` and the ip address is `192.168.122.130`

## Quick-Start
```bash
git clone --recursive https://github.com/yiq/gene.iobio.local
cd gene.iobio.local
./fetch-data.sh     # this will take a while.  (1)
./start.sh gene     # the argument is the hostname  (2)
```
Once everything starts up, open a browser on your client machine, and go to `http://gene/`

## Explaination
### Line (1)
Some of the backend services requires data files such as the human reference. This script will download all the required data volumes and uncompress them into $REPO/data-vol. These data volumes will then be mapped into the docker containers.

### Line (2)
This script takes one argument, which is the hostname, and modify a diff file which will then be applied to the stock gene.iobio source tree to adjust the service endpoints accordingly. After that, the script will run `docker-compose up -d` to bring the whole stack up.
