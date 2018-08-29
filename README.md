####
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

          原理: map, reduce, shuffle, partition, combinner

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

2. kafka

  2.1 kafka产生背景、使用场景
  
  2.2 kafka 特点
  
  2.3 kafka 设计
  
       文件分段
       partition
       message
       文件索引，index
        
  2.4 传统消息队列对比
  
  2.5 kafka 架构
  
  2.6 kafka 基本概念
  
       topic
       partition
         高并发
         数据量
       broker
         大力节点， 可批量写入
         无状态
       producer
         起步批量处理， 提高效率
       consumer
          consumer group
       message
          offset
          massageSize
          data
          处理机制：根据index 搜索 log 文件
         发送机制
         
  2.7 kafka事务
  
      at-least-once
      at-most-once
      exactly-once

  2.8 kafka 存储策略
  
      topic -> partition -> segment

  2.9 Kafka的分布式实现

  实验4 kafka安装使用


3. flume

  3.1 简介
  
  3.2 架构
  
      source, sink, channle, interceptor, 可靠性
      
  3.3 使用场景

   实验5: flume 安装测试

4. spark

    4.1 简介
    
    4.2 特点
    
       快速， 通用，高度开放
       
    4.3 组件
    
        spark sql , ml, streaming, graphx

    4.4 核心概念
    
        driver(sparkContext), executor, rdd, 函数（序列化问题）

    4.5 RDD介绍
    
        rdd 概念
        rdd 血缘关系

    4.6 trandformations
    
        map
        结合操作
        常见tf

    4.7 action


    实验6: spark wordCount

5. 整个串联
