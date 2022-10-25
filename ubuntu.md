# /etc/profile

# TLW
export NODE14_16_HOME=/media/tlw/move/opt/node-v14.16.1-linux-x64
export NODE14_18_HOME=/media/tlw/move/opt/node-v14.18.3-linux-x64
export NODE16_HOME=/home/tlw/opt/node-v16.13.2-linux-x64
export NODE_HOME=$NODE14_18_HOME

export JAVA11_HOME=/media/tlw/move/opt/jdk-11.0.11
export JAVA8_HOME=/media/tlw/move/opt/jdk-8u321-linux-x64/jdk1.8.0_321
export JAVA_HOME=$JAVA11_HOME
#export JAVA_HOME=$JAVA8_HOME
export MAVEN_HOME=/media/tlw/move/opt/apache-maven-3.8.4

export HOME=/home/tlw

export GOROOT=/home/tlw/opt/go1.16.6.linux-amd64/go
export GOPATH=/home/tlw/go

export TYPORA_HOME=/home/tlw/opt/Typora-linux-64
export VSCODE_HOME=/home/tlw/opt/VSCode-linux-x64
export VSCODE_SERVER_HOME=/home/tlw/opt/code-server-3.12.0-linux-amd64

export PATH=$GOROOT/bin:$GOPATH/bin:$JAVA_HOME/bin:$TYPORA_HOME:$MAVEN_HOME/bin:$NODE_HOME/bin:$VSCODE_HOME:$VSCODE_SERVER_HOME/bin:$PATH
export GOPROXY=https://goproxy.io,direct

# /etc/docker
{
  "insecure-registries": ["172.16.0.183:8082", "registry.winning.com.cn"],
  "hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"],
  "registry-mirrors": ["https://1wpwp4gi.mirror.aliyuncs.com"]
}


# /etc/fstab
UUID=6A1CE88F1CE85819 /media/tlw/move ntfs defaults  0  2

# python 
apt update
sudo apt install python3-pip
sudo pip install virtualenv
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
cd /media/tlw/move
/usr/local/bin/virtualenv py310
#vi ~/.bashrc
/media/tlw/move/py310/bin/activate
# exit
/deactivate

# desktop: vi /usr/share/applications/code.desktop
[Desktop Entry]
Name=VSCode
Comment=CodeEditor
Exec=/media/tlw/move/opt/code-stable-x64-1665614670/VSCode-linux-x64/bin/code
Type=Application
 
