参考: https://www.cloudera.com/documentation/enterprise/5-13-x/topics/quickstart_docker_container.html

linux: cloudera测试环境尝试

docker run --hostname=quickstart.cloudera --privileged=true -t -i -p 7180:7180 -p 8888:8888 /usr/bin/docker-quickstart
docker run --hostname=quickstart.cloudera --privileged=true -t -i -p 7180:7180 -p 8888:8888 2527c92864d9 /bin/bash
/usr/bin/docker-quickstart
./cloudera-manager --express