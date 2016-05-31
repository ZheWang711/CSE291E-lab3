# remove all existing containers
docker rm -f `docker ps -aq`

# create a data volume container
docker create -v /data --name datavolume zhe/data /bin/true

sudo ./resize-cluster.sh 5
sudo ./start-container.sh 5
