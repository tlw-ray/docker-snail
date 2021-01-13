## Ubuntu系统通用操作

### 概述

Ubuntu14安装完成后，通常需要做一些操作才能正常使用。整理如下。

注意: 以下操作均需要**root**用户。

### 基本配置

1. 修改root密码

~~~bash
passwd root
# 按提示输入当前用户密码
# 按提示输入两次新的root密码
~~~

2. 修改vi键盘配置解决方向键、Backspace键不正常问题

~~~bash
vi /etc/vim/vimrc.tiny

# 添加如下两行内容
set nocompatible
set backspace=2
~~~

3. 更换apt阿里源

~~~bash
# 备份原有文件
cp /etc/apt/sources.list /etc/apt/sources.list.bak

# 将下列内容替换入sources.list文件
cat>/etc/apt/sources.list<<EOF
deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
EOF

# 更新
apt-get update
~~~

3.1 阿里源报错更换科大源
- 备份  /etc/apt/sources.list
- 将内容替换为: 
# 默认注释了源码仓库，如有需要可自行取消注释
deb https://mirrors.ustc.edu.cn/ubuntu/ xenial main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse

### 安装常用软件

- vim

~~~bash
apt-get install vim-common
~~~

- 安装GIT

~~~bash
apt-get install git -y

vi /etc/hosts

# 添加如下内容入/etc/hosts
# GitHub Start
52.74.223.119 github.com
192.30.253.119 gist.github.com
54.169.195.247 api.github.com
185.199.111.153 assets-cdn.github.com
151.101.76.133 raw.githubusercontent.com
151.101.108.133 user-images.githubusercontent.com
151.101.76.133 gist.githubusercontent.com
151.101.76.133 cloud.githubusercontent.com
151.101.76.133 camo.githubusercontent.com
151.101.76.133 avatars0.githubusercontent.com
151.101.76.133 avatars1.githubusercontent.com
151.101.76.133 avatars2.githubusercontent.com
151.101.76.133 avatars3.githubusercontent.com
151.101.76.133 avatars4.githubusercontent.com
151.101.76.133 avatars5.githubusercontent.com
151.101.76.133 avatars6.githubusercontent.com
151.101.76.133 avatars7.githubusercontent.com
151.101.76.133 avatars8.githubusercontent.com
# GitHub End
~~~

- oh-my-zsh

~~~bash
apt-get install zsh
# 退出到当前用户
exit 
# 进入插件目录
cd ~/.oh-my-zsh/plugins
# 下载syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# 下载zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions
# 下载autojump
git clone https://github.com/wting/autojump.git
cd autojump
python3 install.sh
# 开启插件
vi ~/.zshrc
# 找到plugins=(git)修改为如下内容
plugins=(git z autojump docker extract grunt gulp gradle golang mvn man kubectl helm rsync vscode npm zsh-autosuggestions)
# ~/.zshrc最后一行加入
source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# 为python建立软链接
ln -s /usr/bin/python3 /usr/bin/python
# 更新oh-my-zsh配置，注意需要在zsh下而非bash
source ~/.zshrc
~~~


- docker

~~~bash
# 安装docker服务
apt-get install docker.io

# 禁用selinux?Ubuntu不需要
getenforce 

# 禁用防火墙? Ubuntu不需要
wfw status

# 配置docker服务去掉-H参数? Ubuntu不需要
vi /lib/systemd/system/docker.service

# 添加阿里源镜像
# 开启本机远控端口
# 设定默认桥接网络区间
# 设定默认docker-compose网络区间
vi /etc/docker/daemon.json
{ 
	"insecure-registries": ["172.16.0.183:5000", "172.16.0.183:8081", "winning.repo"], 
	"registry-mirrors": ["https://1wpwp4gi.mirror.aliyuncs.com"], 
	"hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"],
	"log-driver": "json-file",
	"log-opts": {"max-size": "500m", "max-file": "3"}，
	"bip": "10.17.0.1/16",
	"default-address-pools" : [{
		"base" : "10.18.0.0/16",
		"size" : 24
	}],
}

# 添加信任的仓库
vi /etc/hosts
172.16.6.251 winning.repo
docker login winning.repo -u docker
密码: dk123
证书????

# 重新加载服务配置
systemctl enable docker
systemctl daemon-reload
systemctl restart docker

# 安装docker-compose
wget https://github.com/docker/compose/releases/download/1.27.4/docker-compose-Linux-x86_64
mv docker-compose-Linux-x86_64 docker-compose
chmod +x docker-compose
mv docker-compose /usr/local/bin/
docker-compose --version
~~~

- nodejs

~~~bash
# 安装nodejs
使用普通用户安装nodejs
exit 
wget -c https://nodejs.org/dist/v15.5.1/node-v15.5.1-linux-x64.tar.xz
tar -vxf node-v15.5.1-linux-x64.tar.xz
mv node-v15.5.1-linux-x64 ~/opt/
rm -f node-v15.5.1-linux-x64.tar.xz
# TODO 后面要配置环境变量NODE_PATH

# 设定阿里源
npm config set registry https://registry.npm.taobao.org
# 使修改立即生效
source ~/.bashrc
# 退出root用户重复上两步骤操作在普通开发用户
exit
npm config set registry https://registry.npm.taobao.org
# 推出zsh在bash下执行
exit
source ~/.bashrc
~~~

- vscode 

~~~bash
# 下载
mkdir ~/opt
cd ~/opt
https://az764295.vo.msecnd.net/stable/ea3859d4ba2f3e577a159bc91e3074c5d85c0523/code_1.52.1-1608136922_amd64.deb
# 安装
dpkg -i code_1.52.1-1608136922_amd64.deb
# 插件
eclipse
plantUML
vuetur
~~~

- gradle 4.10.3

~~~bash
cd ~/opt
wget -c https://services.gradle.org/distributions/gradle-4.10.3-all.zip
unzip gradle-4.10.3-all.zip
mv gradle-4.10.3-all.zip ~/opt/backup
~~~

-  idea

~~~bash
# 下载
cd ~/opt
https://download.jetbrains.com/idea/ideaIC-2020.3.1.tar.gz
# 安装
tar -vxf ideaIC-2020.3.1.tar.gz
# 注意: 启动IDEA并打开java项目后会自动下载jdk15到~/.jdks目录下
# 插件
plantuml
antlr4

~~~

- graphviz

~~~bash
apt-get install graphviz
~~~

- absru

无法安装, 需要选择其他的可能
参考: https://docs.asbru-cm.net/General/Installation/

### 配置

- 配置/etc/profile

~~~bash
# 配置java
export JAVA11_HOME=/home/tlw/opt/idea-IC-203.6682.168/jbr
export JAVA15_HOME=/home/tlw/.jdks/openjdk-15.0.1
# 配置node
export NODE15_HOME=/home/tlw/opt/node-v15.5.1-linux-x64
# 配置maven
export MAVEN3_HOME=/home/tlw/opt/idea-IC-203.6682.168/plugins/maven/lib/maven3
# 配置gradle
export GRADLE4_HOME=/home/tlw/opt/gradle-4.10.3

PATH=$PATH:$JAVA11_HOME/bin:$NODE15_HOME/bin:$MAVEN3_HOME/bin:$GRADLE4_HOME/bin
~~~

- 配置文件watch数量

否则node在运行时会报错
执行：vim /etc/sysctl.conf，添加如下内容：
~~~bash
fs.inotify.max_user_watches=524288
sysctl -p
~~~



