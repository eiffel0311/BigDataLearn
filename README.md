1. 大数据基本概念

    1.1 大数据背景与发展
       1.1.1 大数据产生的原因、应用
       1.1.2 大数据变现

    1.2 什么是大数据
       1.2.1 大数据概念
       1.2.2 4v 特性

    1.3 大数据产生的价值
       1.3.1 实际应用

    1.4 数据解决方案选型
       1.4.1 传统解决方案、大数据方案狭义概念
       1.4.2 传统解决方案 vs 大数据方案狭义概念
       1.4.3 大数据方案架构
             解决的问题
             架构
       1.4.4 大数据技术栈
             基础： linux
             核心： hadoop(hdfs、hive、mr ......)
             收集： flume、logstash
             消息队列：kafka
             分析： spark
             
                   
2. linux 操作系统
    2.1 简介
    2.2 Linux版本基线
    2.3 基本要求
    实验1 基本命令行
    实验2 环境变量


3.  hadoop 生态介绍
    3.1 hadoop 简介
        组件
        架构
        特点
    3.2 hdfs 介绍
        读
        写
        可靠性保证
    3.3 mr
        概念
        原理
    3.4 yarn
    3.5 其他
        3.5.1 hive
        3.5.2 sqoop

    实验3 hadoop 生态熟悉
          1. cloudera manager 安装（讲解）
          2. hdfs
          3. mr（讲解）
          4. hive（讲解）
          5. sqoop（讲解）


------------------------
4. 数据收集
   4.1 数据源分类
       来源
           ftp
           database
        格式
           excel
           csv
           txt
           nginx/IIS log 重点
        结构
           结构化的（table）
           半结构化（html, log）
           非结构化的（二级制文件）

   4.2 数据收集技术
        4.2.1 sqoop
        4.2.2 shell
        4.2.3 埋点
              js
              app
              胖客户端
        4.2.4 logstash
              flume
              kafka
        4.2.4 日志备份

5. kafka
   实验4: kafka 安装测试

6. flume
   实验5: flume 安装测试

7. spark
   实验6: spark wordCount

8. 整个串联