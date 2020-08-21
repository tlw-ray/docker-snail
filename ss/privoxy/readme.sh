https://blog.csdn.net/rimke/article/details/91047785

## CentOS/RHEL
yum -y install privoxy


# 添加 socks5 转发配置
echo 'forward-socks5 / 127.0.0.1:1080 .' >>/etc/privoxy/config
 
# 启动 privoxy.service
systemctl start privoxy.service
systemctl -l status privoxy.service

# 关于 gfwlist2privoxy 脚本
# 脚本依赖 base64、curl(支持 https)、perl5 v5.10.0+
 
# 获取 gfwlist2privoxy 脚本
curl -4sSkLO https://raw.github.com/zfl9/gfwlist2privoxy/master/gfwlist2privoxy
 
# 生成 gfwlist.action 文件
bash gfwlist2privoxy '127.0.0.1:1080'
 
# 检查 gfwlist.action 文件
more gfwlist.action # 一般有 5000+ 行
 
# 应用 gfwlist.action 文件
mv -f gfwlist.action /etc/privoxy
echo 'actionsfile gfwlist.action' >>/etc/privoxy/config
 
# 启动 privoxy.service 服务
systemctl start privoxy.service
systemctl -l status privoxy.service

# TLW20200315: 此处在CentOS8启动服务可能会失败
# 注意以上步骤完成后，可以在当前路径下建立config文件，内容同文中/etc/privoxy/config
# 此时当前路径下执行privoxy，即可以基于该config文件开启socks5转http代理



# privoxy 默认监听端口为 8118
proxy="http://127.0.0.1:8118"
export http_proxy=$proxy
export https_proxy=$proxy
export no_proxy="localhost, 127.0.0.1, ::1"
 
# no_proxy 环境变量是指不经过 privoxy 代理的地址或域名
# 只能填写具体的 IP、域名后缀，多个条目之间使用 ',' 逗号隔开
# 比如: export no_proxy="localhost, 192.168.1.1, ip.cn, chinaz.com"
# 访问 localhost、192.168.1.1、ip.cn、*.ip.cn、chinaz.com、*.chinaz.com 将不使用代理



# 访问网站，有网页源码输出说明 OK
curl -4sSkL https://www.baidu.com
curl -4sSkL https://www.google.com
curl -4sSkL https://www.google.co.jp
curl -4sSkL https://www.google.com.hk
curl -4sSkL https://www.youtube.com
curl -4sSkL https://www.facebook.com
curl -4sSkL https://www.wikipedia.org
 
# 获取当前 IP 地址，应该显示本机 IP
curl -4sSkL https://myip.ipip.net
