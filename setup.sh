docker-machine create --virtualbox-boot2docker-url=https://github.com/boot2docker/boot2docker/releases/download/v18.05.0-ce/boot2docker.iso master

docker-machine ssh master < install-docker-compose.sh

docker-machine ssh master "docker swarm init --advertise-addr 192.168.99.104"
Swarm initialized: current node (r1469bgoc20tlykl0qvqoagm2) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-0io60q3z2v1760543m48w2x2wqlpot5sdkegyip7kr2eu8ffkr-dpkonl6upjvoh4mrthp6mavzh 192.168.99.104:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

docker-machine scp -r project master:/home/docker

docker-machine ssh master "cd project/docker && docker login -u $USERNAME -p $PASSWORD && docker-compose config > config.yml && docker stack deploy --compose-file config.yml master --with-registry-auth"
