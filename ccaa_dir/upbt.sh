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
