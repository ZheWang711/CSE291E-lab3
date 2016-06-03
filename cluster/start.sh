sudo docker network create -d bridge CSE291-lab3
docker run -it --net=CSE291-lab3 --name master zhewang711/base /bin/bash
docker run -it --net=CSE291-lab3 --name slave1 zhewang711/base service ssh start
docker run -d -p 52024:22 --net=CSE291-lab3 --name slave2 zhewang711/base /bin/bash
docker run -d -p 52025:22 --net=CSE291-lab3 --name slave3 zhewang711/base /bin/bash
docker run -d -p 52026:22 --net=CSE291-lab3 --name slave4 zhewang711/base /bin/bash
