export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar

echo "starting hdoop"
 ./start-hadoop.sh

echo "leaving safe mode"
hdfs dfsadmin -safemode leave

echo "copying input file into HDFS"
hadoop fs -mkdir -p input
hadoop fs -put /data/input1.txt input
hadoop fs -put /data/input2.txt input
hadoop fs -put /data/input3.txt input


echo "compile .java into .jar"
hadoop com.sun.tools.javac.Main /data/WordCount.java
jar cf /wc.jar /data/WordCount*.class
echo "compile complete"

echo "running task"
hadoop jar /wc.jar data/WordCount input output
# want to see the class name in a jar? jar tvf jarfile.jar

echo "display the result"
hadoop fs -cat output/part-r-00000
