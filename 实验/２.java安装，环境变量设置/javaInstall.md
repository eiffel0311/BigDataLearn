### 环境准备 
#### ubuntu/linux
#### 下载　ubuntu-17.04-desktop-amd64.iso:　[https://pan.baidu.com/s/1A2vFNVNr9zyRqMuxyL63wA](https://pan.baidu.com/s/1A2vFNVNr9zyRqMuxyL63wA "")
#### 实验目标: 安装java,　为编写和运行java程序做准备

## 1.    把下载的jdk 拷贝到/opt/java（具体的位置，　用户可以自定义, 稍后会设置环境变量）下
```
mv jdk-8u161-linux-x64.tar.gz /usr/java
```
## ２.　打开vmware, 新建虚拟机
```

```

## ３.　选择下载的ubuntu-17.04-desktop-amd64.iso路径
```
export JAVA_HOME=/usr/java/jdk1.8.0_161
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
```
