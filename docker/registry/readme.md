# 搭建私有容器仓库和界面

[TOC]

## 概述

由于各个医院现场对外网的访问有严格的控制， 不能直接访问 repository.winning.com.cn。 为便于发布容器化软件制品, 可以通过在医院内网安装私有镜像仓库，通过端口映射后该仓库端口在本地可访问后， 从内网远程推送容器到现场。对于目前上传镜像文件到现场的方式，通过本方案差异化上传会大大提升效率。

> 注: 本方案目前无法解决从linux服务器直接访问医院的问题。

## 部署流程

下载并解压[registry.tar](http://172.16.0.142/tools/tlw/2023/registry/registry.tar), 获得类似如下的目录结构: 

~~~
.
└── registry
    ├── docker-compose.yml   # 容器组启动描述文件
    ├── readme.md            # 本文档
    ├── registry
    │   └── config.yml       # 镜像仓库配置文件
    └── registry-web
        └── conf
            └── config.yml   # 镜像仓库界面配置文件
~~~

### 启动容器组

通过如下命令可启动容器组。

~~~bash
docker-compose up -d
~~~

### docker仓库信任配置

要拉取私有仓库内镜像的机器，docker需要配置仓库信任后才能拉取， 否则会报安全错误。

~~~bash
sudo vi /etc/docker/daemon.json  # 默认无此文件，需自行添加，有则追加以下内容。

{ "insecure-registries":["xx.xx.xx.xx:5000"] }　　# 指定IP地址或域名

systemctl daemon-reload          # 守护进程重启
systemctl restart docker         # 重启docker服务
~~~

### 效果

以本机ubuntu镜像为例， 将其推送到私有仓库。

~~~bash
docker tag ubuntu:20.04 127.0.0.1:5000/ubuntu:20.04 # 为ubuntu:20.04打私有仓库名标签
docker push 127.0.0.1:5000/ubuntu:20.04             # 将该镜像推送到私有仓库
docker pull 127.0.0.1:5000/ubuntu:20.04             # 使用本机IP拉取该镜像
docker pull 172.16.208.247:5000/ubuntu:20.04        # 使用内网IP拉取该镜像
~~~

## 开发测试环境

- Docker version 20.10.7, build 20.10.7-0ubuntu5~18.04.3
- docker-compose version 1.29.2, build 5becea4c

## 参考 

- 开源项目首页: https://github.com/mkuchin/docker-registry-web/tree/master/examples/auth-disabled
- 相关文章: https://www.cnblogs.com/leozhanggg/p/12050322.html
- 官方Registry文档: https://docs.docker.com/registry/
