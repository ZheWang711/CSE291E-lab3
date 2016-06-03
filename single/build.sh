./clean.sh
docker build -t zhe/lab3 .
#docker run --name=mapreduce_lab -it zhe/lab3 /etc/bootstrap.sh -bash
docker run --name=mapreduce_lab -it zhe/lab3 /lab3/boost.sh

# hehehe
