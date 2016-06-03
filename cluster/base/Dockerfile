FROM java:7
MAINTAINER Zhe Wang <zhw176@ucsd.edu>
RUN apt-get update
RUN apt-get install openssh-server rsync -y
COPY hadoop /usr/local/hadoop
COPY start_service.sh /

# /root/.ssh/id_rsa & /root/.ssh/id_rsa.pub
RUN  echo | ssh-keygen -t rsa -P ''
# add id_rsa.pub to authorized keys file.
RUN cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys

# hadoop
ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV HADOOP_HOME /usr/local/hadoop

RUN service ssh start
