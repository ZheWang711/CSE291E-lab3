# CSE291E-lab3
Running Hadoop map reduce in docker

# How to run this project
* change current directory: `cd /XXX.../lab3/bigram/` (change `XXX...` according to your machine)
* build docker image: `bigram/build.sh`, Then you will log in a docker container, with terminal showing `bash-4.1#`
* part 1: to run a word count example:
    * `/lab3/part1-wordcnt.sh`
* part 2


# Reference
 * This project is built based on https://hub.docker.com/r/sequenceiq/hadoop-docker/
 * Word count example: https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html#MapReduce_Tutorial
 * How to configure 4 nodes: http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/ClusterSetup.html
