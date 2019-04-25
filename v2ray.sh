systemctl stop dovecot
systemctl stop postfix

systemctl disable dovecot
systemctl disable postfix

service  dovecot  stop
service  postfix  stop
chkconfig  dovecot off
chkconfig  postfix  off

yum -y install git unzip wget ntpdate

ntpdate pool.ntp.org

local=$(cd `dirname $0`; pwd)
v2ray=/mickey/v2ray-server


echo local-path $local
echo v2ray-path $v2ray

mkdir -p $v2ray


if [ ! -d "$v2ray" ];then
    mkdir -p $v2ray
    git clone https://github.com/MickeyMi/v2ray-server.git -l $v2ray
else
    git pull https://github.com/MickeyMi/v2ray-server.git -l $v2ray
fi

bash <(curl -L -s https://install.direct/go.sh)

mv -f $v2ray/config.json /etc/v2ray/config.json
mv -f $v2ray/v2ray.sh $local/v2ray.sh

chmod 777 $local/v2ray.sh

service v2ray stop
service v2ray start
