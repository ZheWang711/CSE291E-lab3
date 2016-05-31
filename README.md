# CSE291E-lab3
Running Hadoop map reduce in docker

# How to run word count in a single docker container using hadoop pseudo distributed mode
* Change current directory: `cd /XXX.../lab3/single/` (change `XXX...` according to your machine)
* Build docker image and run the task: `single/build.sh`, wait until finish, then you will see the result.
* To clean up, execute `./clean.sh`

# Reference
 * Single node pseudo distributed mode is based on: https://hub.docker.com/r/sequenceiq/hadoop-docker/
 * Cluster mode is based on: https://github.com/kiwenlau/hadoop-cluster-docker
 * Word count example: https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html#MapReduce_Tutorial
 * How to configure 4 nodes: http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/ClusterSetup.html
