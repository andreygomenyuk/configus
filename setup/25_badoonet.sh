
set -x

if [ "$(id -u)" != "0" ]; then
    echo -e "\033[31m\aThis script must be run as root\033[0m" 1>&2
    exit 1
fi

mkdir -p /etc/resolver
echo "nameserver 192.168.17.170" > /etc/resolver/d3
echo "nameserver 192.168.17.170" > /etc/resolver/d4
echo "nameserver 192.168.17.170" > /etc/resolver/mlan
echo "nameserver 192.168.17.170" > /etc/resolver/ulan
echo "nameserver 192.168.17.170" > /etc/resolver/shot
echo "nameserver 192.168.17.170" > /etc/resolver/staffpass.com
echo "nameserver 192.168.17.170" > /etc/resolver/msk
echo "nameserver 192.168.17.170" > /etc/resolver/ukoffice
echo "nameserver 192.168.17.170" > /etc/resolver/lnd
echo "nameserver 192.168.17.170" > /etc/resolver/badoojira.com
echo "nameserver 192.168.17.170" > /etc/resolver/badoo.bi
echo "nameserver 192.168.17.170" > /etc/resolver/magiclab.bi
echo "nameserver 192.168.17.170" > /etc/resolver/consul
dscacheutil -flushcache
killall -HUP mDNSResponder

