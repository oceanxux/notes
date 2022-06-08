网络重装脚本


PS：自定义密码直接 -p 你想要的密码就行！！！


部分机器需要设置网卡，否则可以VNC，但是不能远程SSH

-firmware                额外的驱动支持

-d                        Debian系统 后面是系统版本号

-c                        Centos系统 后面是系统版本号

-v                         后面写64位 32位

-a                        不清楚这个干啥的但是每个脚本都带

--mirror                后面是镜像源地址

-p                        后面写自定义密码

–ip-addr                 ifconfig -a 后获取到的 例：194.87.xxx.xxx

–ip-gate                 route -n    后获取到的 例   194.87.xxx.xxx

–ip-mask                 255.255.xxx.xx
复制代码


· 甲骨文、三毛、Vir、RN等大部分VPS通用，三毛、甲骨文 记得去掉 -firmware

bash <(wget --no-check-certificate -qO- 'https://moeclub.org/attachment/LinuxShell/InstallNET.sh') -d 11 -v 64 -a -firmware -p 自定义密码


PS:如果你是腾讯云记得卸载组件 否则会导致报错 DD失败

systemctl stop tat_agent
systemctl disable tat_agent
rm -rf /etc/systemd/system/tat_agent.service
rm -fr /usr/local/qcloud

ps -A | grep agent
# 检查看是否还有腾讯云组件
# kill 这个进程

· 国内VPS需要更换镜像源否则很慢！我这里使用的华为源，如果你是腾讯云后面可以换成内网源，节省流量，下面有写！

bash <(wget --no-check-certificate -qO- 'https://moeclub.org/attachment/LinuxShell/InstallNET.sh') -d 11 -v 64 -a --mirror 'https://mirrors.huaweicloud.com/debian/' -p 自定义密码


镜像站地址
官方给出的地址列表：https://www.debian.org/mirror/list

一些国内的
ftp.cn.debian.org
mirror.bjtu.edu.cn
mirror.lzu.edu.cn       
mirror.nju.edu.cn       
mirrors.163.com       
mirrors.bfsu.edu.cn       
mirrors.hit.edu.cn       
mirrors.huaweicloud.com       
mirror.sjtu.edu.cn       
mirrors.tuna.tsinghua.edu.cn       
mirrors.ustc.edu.cn       

使用方法：（大致都是一样的）

清华源
--mirror 'https://mirrors.ustc.edu.cn/debian/'

腾讯源
--mirror 'http://mirrors.tencent.com/debian/'
--mirror 'http://mirrors.cloud.tencent.com/debian/'

腾讯源内网（dd完毕后可以修改 走内网不费额外流量）
http://mirrors.tencentyun.com/

阿里源
--mirror 'https://mirrors.aliyun.com/debian/'

华为源
--mirror 'https://mirrors.huaweicloud.com/debian/'



· DD windows

wget --no-check-certificate -qO InstallNET.sh 'https://moeclub.org/attachment/LinuxShell/InstallNET.sh' && bash InstallNET.sh -dd 'http://d.nat.ee/win/lite/win7-ent-sp1-x64-cn/win7-ent-sp1-x64-cn.vhd.gz'

后面的链接为windows系统直链 可以去 dd.nat.ee 下载 


· 带 WebUI 可查看进度的

https://raw.githubusercontent.com/flyqie/dd-shell/master/Core_Install.sh


国内机可使用

https://ghproxy.com/https://raw.githubusercontent.com/flyqie/dd-shell/master/Core_Install.sh




宝塔面板&AApanel


一键破解宝塔

国外VPS
wget https://raw.githubusercontent.com/AaronYES/aaPanel/main/script/aapanel.sh  -O aapanel.sh && chmod +x aapanel.sh && clear && ./aapanel.sh


国内VPS
wget https://ghproxy.com/https://raw.githubusercontent.com/AaronYES/aaPanel/main/script/aapanel.sh  -O aapanel.sh && chmod +x aapanel.sh && clear && ./aapanel.sh

Debian系统

# 宝塔
wget -O install.sh http://download.bt.cn/install/install-ubuntu_6.0.sh && bash install.sh

# aapanel
wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && bash install.sh



有次无聊看了看文件发现aapanel就是宝塔的换皮，语言换成了英语，所以破解方法一样。

# 宝塔去实名认证
rm -rf /www/server/panel/data/bind.pl

# 宝塔&aapanel破解
编辑 /www/server/panel/class/panelplugin.py
找到 softList['list'] = tmpList 这行代码
在下面添加以下代码，注意缩进

softList['pro'] = 1
for soft in softList['list']:
soft['endtime'] = 0

修改宝塔标识（企业版ltd、专业版pro）
编辑 /www/server/panel/data/plugin.json
搜索 "pro": 把后面的-1 改为0 即可
编辑完毕后保存重启面板即可



常用脚本

一键开启BBR（适用于较新的Debian、Ubuntu）

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
sysctl net.ipv4.tcp_available_congestion_control
lsmod | grep bbr



superbench

wget -qO- git.io/superbench.sh | bash



Bench.sh

wget -qO- bench.sh | bash


三网测速

bash <(curl -Lso- http://yun.789888.xyz/speedtest.sh)



流媒体

# 第一个
bash <(curl -L -s https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/check.sh)

# 第二个
bash <(curl -sSL "https://github.com/CoiaPrant/MediaUnlock_Test/raw/main/check.sh")

# 第三个(和第一个一样)
bash <(curl -L -s check.unlock.media)


回程

# 第一个
wget https://raw.githubusercontent.com/nanqinlang-script/testrace/master/testrace.sh
bash testrace.sh

# 第二个
wget -qO- git.io/besttrace | bash

# 第三个
curl http://tutu.ovh/bash/returnroute/test.sh | bash


yabs 机器跑分

curl -sL yabs.sh | bash



一件安装docker
国外机

curl -sSL https://get.docker.com/ | sh


国内机

curl -sSL https://get.daocloud.io/docker | sh


卸载docker

sudo apt-get remove docker docker-engine
rm -fr /var/lib/docker/
复制代码

安装docker-compose
国外机

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


国内机

curl -L https://get.daocloud.io/docker/compose/releases/download/v2.1.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

