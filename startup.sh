#!/bin/bash

#构建镜像
docker build -t tanjie/springbootwithskywalking:v1 .

#删除已存在容器
docker rm -f springbootwithskywalking &> /dev/null

#启动容器
docker run --name springbootwithskywalking -d tanjie/springbootwithskywalking:v1

#查看容器日志
docker logs -f springbootwithskywalking