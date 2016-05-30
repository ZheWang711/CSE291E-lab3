#!/bin/bash
: ${HADOOP_PREFIX:=/usr/local/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

rm /tmp/*.pid

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

# altering the core-site configuration
sed s/HOSTNAME/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml


service sshd start
$HADOOP_PREFIX/sbin/start-dfs.sh
$HADOOP_PREFIX/sbin/start-yarn.sh

echo "leaving safe mode"
/usr/local/hadoop/bin/hdfs dfsadmin -safemode leave

echo "copying input file into HDFS"
/usr/local/hadoop/bin/hadoop fs -put /lab3 /

# echo "starting bash"
# /bin/bash

export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar

echo "compile .java into .jar"
/usr/local/hadoop/bin/hadoop com.sun.tools.javac.Main /lab3/WordCount.java
jar cf /wc.jar /lab3/WordCount*.class
echo "compile complete"

echo "running task"
/usr/local/hadoop/bin/hadoop jar wc.jar lab3/WordCount /lab3/input.txt /lab3/output
# want to see the class name in a jar? jar tvf jarfile.jar

echo "display the result"
/usr/local/hadoop/bin/hadoop fs -cat /lab3/output/part-r-00000

echo "if you want to clean things up, execute ./clean.sh"
