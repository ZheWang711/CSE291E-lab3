# CSE291E-lab3
Running Hadoop map reduce in docker

### Input file
Input1.txt:
```
line1. line1. line1!
line2, line2, line2
line3 line3..

```

Input2.txt
```
Hello Docker!
Hello World!

```

Input3.txt
```
Hello Hadoop!
Hello World!

```

### How to run word count in a single docker container using Hadoop pseudo distributed mode
* Change current directory: `cd /XXX.../lab3/single/` (change `XXX...` according to your machine)
* Build docker image and run the task: `single/build.sh`, wait until finish, then you will see the result.
* To clean up, execute `./clean.sh`

### How to run Hadoop in cluster mode using docker
* Note: this section is based on the work of Kai LIU: https://github.com/kiwenlau/hadoop-cluster-docker
* Configure the environment
    * Change current directory `cd cluster`
    * Pull the dependent docker image `sudo ./boost.sh`
    * Create data volume image and rebuild master image `sudo ./build-image.sh hadoop-master`
        * Note this script will remove all running / waiting containers
    * Start the container `sudo ./bootstrap.sh`, now you will be in a session with the master node of a Hadoop cluster with 4 slave nodes.
* Run the same word count program as last section in cluster mode
    * `/data/wordcount.sh`
* Run the bigram count program in cluster mode
    * `/data/bigrams.sh`


# Reference
 * Single node pseudo distributed mode is based on: https://hub.docker.com/r/sequenceiq/hadoop-docker/
 * Cluster mode is based on: https://github.com/kiwenlau/hadoop-cluster-docker
 * Word count example: https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html#MapReduce_Tutorial
