

#导入环境变量
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/sbin
export PATH

function up_tracker(){
	#下载最新的bt-tracker
	wget -O /tmp/trackers_best.txt https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt
	tracker=$(cat /tmp/trackers_best.txt)
	#替换处理bt-tracker
	tracker="bt-tracker="${tracker}
	#更新aria2配置
	sed -i '/bt-tracker.*/'d /etc/ccaa/aria2.conf
	echo ${tracker} >> /etc/ccaa/aria2.conf
	echo '-------------------------------------'
	echo 'bt-tracker update completed.'
	echo '-------------------------------------'
}

up_tracker

#重启服务
/usr/sbin/ccaa restart
