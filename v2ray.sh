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

bash <(curl -L -s https://install.direct/go.sh)

https://raw.githubusercontent.com/MickeyMi/v2ray-server/master/config.json -O /etc/v2ray/config.json

service v2ray stop
service v2ray start
