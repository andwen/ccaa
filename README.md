INSTALL:
bash <(curl -Lsk https://raw.githubusercontent.com/andwen/ccaa/refs/heads/main/ccaa.sh)
或者：
*** cdn
双安装源版本

程序路径
Filebrowser二进制文件：/usr/sbin/filebrowser
Aria2二进制文件：/usr/bin/aria2c
ccaa_web二进制文件：/usr/sbin/ccaa_web
CCAA管理脚本：/usr/sbin/ccaa
日志文件
CCAA产生的相关日志文件都位于/var/log/，路径如下：
Aria2日志文件：aria2.log
FileBrowser日志文件：filebrowser.log
FileBrowser运行时产生的日志文件：fbrun.log
ccaa_web运行产生的日志文件：ccaa_web.log

文件管理默认用户名为ccaa，密码为admin，登录后可在后台修改

#进入CCAA管理界面
ccaa 
#查看ccaa状态
ccaa status 
#启动ccaa
ccaa start
#停止ccaa
ccaa stop
#重启ccaa
ccaa restart
#查看当前版本
ccaa -v
#更新tracker list
/etc/ccaa/upbt.sh

开机启动CCAA
systemctl enable aria2
systemctl enable ccaa_web
systemctl enable filebrowser

自动更新BT Tracker列表
#新增计划任务
crontab -e
#添加如下内容
* 2* * 7/etc/ccaa/upbt.sh > /dev/null

upbt.sh :
#import environment variable
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/sbin
export PATH

function up_tracker(){
        #download bt-tracker_best
        wget -O /tmp/trackers_best.txt https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt
        #add comma
        sed 's/$/,/' /tmp/trackers_best.txt >/tmp/trackers_best.txt
        tracker=$(cat /tmp/trackers_best.txt)
        #replace bt-tracker
        tracker="bt-tracker="${tracker}
        #update aria2.conf
        sed -i '/bt-tracker.*/'d /etc/ccaa/aria2.conf
        echo ${tracker} >> /etc/ccaa/aria2.conf
        echo '-------------------------------------'
        echo 'bt-tracker update completed.'
        echo '-------------------------------------'
}

up_tracker

#restart
/usr/sbin/ccaa restart

更改filebrowser ip：
/etc/ccaa/AriaNg/index.html
更改filebrowser default root:
/etc/ccaa/config.json

