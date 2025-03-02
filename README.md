# CCAA

- Aria2 提供离线下载
- ccaa_web支撑AriaNg运行
- AriaNg为Aria2 提供WEB界面
- Filemanager提供文件管理

一键安装脚本（使用root用户）：
```bash
#海外
#国内


```bash
#Debian or Ubuntu
apt-get -y install curl


### Docker安装
```bash
docker run --name="ccaa" -d -p 6080:6080 -p 6081:6081 -p 6800:6800 -p 51413:51413 \
    -v /data/ccaaDown:/data/ccaaDown \
    -e PASS="xiaoz.me" \
    helloz/ccaa \
    sh -c "dccaa pass && dccaa start"
```

* 第一个`/data/ccaaDown`为本地目录，CCAA下载后的内容会保存在此目录，请根据自身情况设置
* `xiaoz.me`为Aria2密钥，运行的时候请修改为自己的密码
* 文件管理默认用户名为`ccaa`，密码为`admin`，登录后可在后台修改


* ccaa:进入CCAA操作界面
* ccaa status:查看CCAA运行状态
* ccaa stop:停止CCAA
* ccaa start:启动CCAA
* ccaa restart:重启CCAA
* ccaa -v:查看CCAA版本
