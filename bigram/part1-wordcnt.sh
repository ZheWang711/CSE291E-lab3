export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar

echo "naming leave safe mode"
/usr/local/hadoop/bin/hdfs dfsadmin -safemode leave

echo "copying input file into HDFS"
/usr/local/hadoop/bin/hadoop fs -put /lab3 /
/usr/local/hadoop/bin/hadoop fs -ls /lab3
echo "copying input file into HDFS succeed"

echo "compile .java into .jar"
/usr/local/hadoop/bin/hadoop com.sun.tools.javac.Main /lab3/WordCount.java
jar cf /wc.jar /lab3/WordCount*.class
echo "compile complete"

echo "running task"
/usr/local/hadoop/bin/hadoop jar wc.jar lab3/WordCount /lab3/input.txt /lab3/output
# want to see the class name in a jar? jar tvf jarfile.jar

echo "display result"
/usr/local/hadoop/bin/hadoop fs -cat /lab3/output/part-r-00000
