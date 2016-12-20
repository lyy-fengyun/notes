# flume 介绍
## 提供者
Cloudera
## 是什么？
- 海量日志采集、聚合和传输的系统。

## 版本
- Flume 0.9X --> Flume-og
- Flume 1.x --> Flume-ng
两个版本有很大不同 

## 特点
- 高可用的
- 高可靠的
- 分布式的

Flume提供对数据进行简单处理，并写到各种数据接受方（可定制）的能力。

## 系统功能
### 日志收集
Flume支持在日志系统中定制各类数据发送方，用于收集数据。

### 数据处理
Flume提供对数据进行简单处理，并写到各种数据接受方（可定制）的能力。
Flume提供了从console（控制台）、RPC（Thrift-RPC）、text（文件）、tail（UNIX tail）、syslog（syslog日志系统，支持TCP和UDP等2种模式），exec（命令执行）等数据源上收集数据的能力。

## 工作方式
- Flume-og采用了多Master的方式。
- 为了保证配置数据的一致性，Flume引入了ZooKeeper，用于保存配置数据，ZooKeeper本身可保证配置数据的一致性和高可用，另外，在配置数据发生变化时，ZooKeeper可以通知Flume Master节点。Flume Master间使用gossip协议同步数据。

- Flume-ng最明显的改动就是取消了集中管理配置的 Master 和 Zookeeper，变为一个纯粹的传输工具。
- Flume-ng另一个主要的不同点是读入数据和写出数据现在由不同的工作线程处理（称为 Runner）。 在 Flume-og 中，读入线程同样做写出工作（除了故障重试）。如果写出慢的话（不是完全失败），它将阻塞 Flume 接收数据的能力。这种异步的设计使读入线程可以顺畅的工作而无需关注下游的任何问题。