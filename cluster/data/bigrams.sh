export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar

echo "starting hdoop"
 ./start-hadoop.sh

echo "leaving safe mode"
hdfs dfsadmin -safemode leave

echo "copying input file into HDFS"
hadoop fs -mkdir -p input-bigram
hadoop fs -put /data/input1.txt input-bigram
hadoop fs -put /data/input2.txt input-bigram
hadoop fs -put /data/input3.txt input-bigram


echo "compile .java into .jar"
hadoop com.sun.tools.javac.Main /data/Bigrams.java
jar cf /bg.jar /data/Bigrams*.class
echo "compile complete"

echo "running task"
hadoop jar /bg.jar data/Bigrams input-bigram output-bigram
# want to see the class name in a jar? jar tvf jarfile.jar

echo "display the bigram result"
hadoop fs -cat output-bigram/part-r-00000

echo "locally processing for displaying final result"
hadoop fs -cat output-bigram/part-r-00000 > /data/bigram-result.txt
/data/final.py /data/bigram-result.txt
