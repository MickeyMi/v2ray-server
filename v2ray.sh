yum -y install git unzip wget

path="/mickey/shell"
v2ray=$path"/v2ray-server"

mkdir -p $path
mkdir -p $v2ray


git clone https://github.com/MickeyMi/v2ray-server.git -l $v2ray

wget https://install.direct/go.sh -O $path/go.sh
bash $path/go.sh -f

mv -f $v2ray/config.json /etc/v2ray/config.json

rm -rf $v2ray
