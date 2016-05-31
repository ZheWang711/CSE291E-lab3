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

### How to run word count in a single docker container using hadoop pseudo distributed mode
* Change current directory: `cd /XXX.../lab3/single/` (change `XXX...` according to your machine)
* Build docker image and run the task: `single/build.sh`, wait until finish, then you will see the result.
* To clean up, execute `./clean.sh`

### How to run hadoop cluster in docker
note: this section is based on the work by Kai LIU's repository: https://github.com/kiwenlau/hadoop-cluster-docker
* Configure the environment
    * Change current directory `cd cluster`
    * Pull the dependent docker image `sudo ./boost.sh`
    * Create data volume image and rebuild master image `sudo ./build-image.sh hadoop-master`
    * Start the container `sudo ./bootstrap.sh`, now you will be in a session with the master node of a hadoop cluster with 4 slave nodes.
* Run the same word count program in claster
    * `/data/wordcount.sh`


# Reference
 * Single node pseudo distributed mode is based on: https://hub.docker.com/r/sequenceiq/hadoop-docker/
 * Cluster mode is based on: https://github.com/kiwenlau/hadoop-cluster-docker
 * Word count example: https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html#MapReduce_Tutorial
 * How to configure 4 nodes: http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/ClusterSetup.html
