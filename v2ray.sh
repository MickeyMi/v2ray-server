systemctl stop dovecot
systemctl stop postfix

systemctl disable dovecot
systemctl disable postfix

service  dovecot  stop
service  postfix  stop
chkconfig  dovecot off
chkconfig  postfix  off

yum -y install git unzip wget

local=$(cd `dirname $0`; pwd)
path="/mickey/shell"
v2ray=$path"/v2ray-server"


echo local-path $local
echo shell-path $path
echo v2ray-path $v2ray

mkdir -p $path
mkdir -p $v2ray


git clone https://github.com/MickeyMi/v2ray-server.git -l $v2ray

wget https://install.direct/go.sh -O $path/go.sh
bash $path/go.sh -f

mv -f $v2ray/config.json /etc/v2ray/config.json
mv -f $v2ray/v2ray.sh $local/v2ray.sh

rm -rf $v2ray
rm -rf $path
