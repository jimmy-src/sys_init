set -x
#!/bin/sh
#****************************************************************#
# ScriptName: run.sh
# Author: liujmsunits@hotmail.com
# Create Date: 2015-4-20
# Modify Author: liujmsunits@hotmail.com
# Modify Date: 2015-05-05 04:22
# Function: wget script and create veriable
#***************************************************************#

/etc/init.d/ntpd stop
if ntpdate 10.70.213.132;then
	    hwclock -w
elif ntpdate 10.70.213.133;then
	    hwclock -w
elif ntpdate 192.168.218.131;then
	    hwclock -w
fi

#rm -rf /root/post
mkdir /root/post/
/usr/bin/wget -T3 -t2 http://192.168.218.131:9999/sys_init/script/post.tgz -O /root/post/post.tgz
cd /root/post/
tar -xzf post.tgz

#bash -x /root/post/script/post/ksis_post.sh 2>&1 |tee -a /root/post/run.log
for i in `ls /root/post/[0-9]*.sh`
do
    source $i 2>&1|tee -a /root/post/run.log
done
