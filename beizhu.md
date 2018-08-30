参考: https://www.cloudera.com/documentation/enterprise/5-13-x/topics/quickstart_docker_container.html

linux: cloudera测试环境尝试

docker run --hostname=quickstart.cloudera --privileged=true -t -i -p 7180:7180 -p 8888:8888 2527c92864d9 /bin/bash
docker run --hostname=quickstart.cloudera --privileged=true -t -i -p 7180:7180 -p 8888:8888 /usr/bin/docker-quickstart

/usr/bin/docker-quickstart
./cloudera-manager --express

spark-submit --master local[*] --class test.WordCount BigDataLearn-1.0-SNAPSHOT.jar file:///home/cloudera/cm_api.py

spark-submit  --master local[2] --conf spark.dynamicAllocation.enabled=false --driver-java-options "-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5555" --conf spark.ui.port=4040 --class test.WordCount BigDataLearn-1.0-SNAPSHOT.jar file:///home/cloudera/cm_api.py