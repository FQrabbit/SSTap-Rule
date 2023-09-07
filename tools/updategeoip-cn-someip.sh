#!/bin/bash
echo "#BypassCNandLan,绕过大陆和局域网someip,1,1,1,0,0,0," >> BypassCNandLan_someip.rules

curl https://raw.githubusercontent.com/Hackl0us/GeoIP2-CN/release/CN-ip-cidr.txt >> BypassCNandLan_someip.rules

sed -i '2{/^$/d;}' BypassCNandLan_someip.rules # 删除源文件内第二行的空行
echo 10.0.0.0/8 >> BypassCNandLan_someip.rules
echo 172.16.0.0/12 >> BypassCNandLan_someip.rules
echo 192.168.0.0/16 >> BypassCNandLan_someip.rules
