### 环境准备 
#### ubuntu/linux
#### 下载　jdk-8u161-linux-x64.tar.gz:　[https://pan.baidu.com/s/1A2vFNVNr9zyRqMuxyL63wA](https://pan.baidu.com/s/1A2vFNVNr9zyRqMuxyL63wA "")
#### 实验目标: 安装java,　为编写和运行java程序做准备

## 1.    把下载的jdk 拷贝到/opt/java（具体的位置，　用户可以自定义, 稍后会设置环境变量）下
```
mv jdk-8u161-linux-x64.tar.gz /usr/java
```
## ２.　解压jdk-8u161-linux-x64.tar.gz
```
unzip jdk-8u161-linux-x64.tar.gz
```

## ３.　vim /etc/profile,  添加如下后保存
```
export JAVA_HOME=/usr/java/jdk1.8.0_161
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
```

## 4.   测试
```
java
java -version
javac
```
