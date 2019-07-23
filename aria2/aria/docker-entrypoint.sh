if [ ! -d /mnt/media/download/complete ]; then  
    mkdir -p /mnt/media/download/complete;
fi

touch /mnt/media/aria2.session
chmod +x /done.sh

list=`wget -qO- https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt|awk NF|sed ":a;N;s/\n/,/g;ta"`
if [ -z "`grep "bt-tracker" /etc/aria2/aria2.conf`" ]; then
    echo adding...
    sed -i '$a bt-tracker='${list} /etc/aria2/aria2.conf
else
    echo updating...
    sed -i "s@bt-tracker.*@bt-tracker=$list@g" /etc/aria2/aria2.conf
fi
echo "done..."

echo "running aria2c"
usr/bin/aria2c --conf-path=/etc/aria2/aria2.conf -D
echo "running nginx"
/usr/sbin/nginx