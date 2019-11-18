> 目前来说，SStap无法解决NAT问题。如果游戏里会有提示NAT类型严格的话，说明此游戏不适用于使用SStap进行加速。也有些游戏采用P2P方式进行联机，一般为某玩家作为房间主机，其余玩家通过与房主间建立连接来进行游戏。继续使用SStap前请知悉。而[Netch]( https://github.com/NetchX/Netch)则能解决以上问题。选择使用SStap这种基于ip地址对游戏进行代理，还是使用基于游戏进程进行代理的Netch，亦或者选择商用加速器，悉听尊便。

> **SStap版本：1.0.9.7**

# 手动编写rules

SStap使用以`.rules`作为后缀名的文件以作为规则。为保证规范，一个rules文件应使用` (游戏完整英文名，首字母大写，空格用 - 代替)-(游戏区服)`作为命名，如`League-of-Legends-tw.rules`。

## 规则文件说明

规则第一行为规则头。有固定的格式。

> #CSGO(规则英文名),
>
> 反恐精英:全球攻势(规则中文名),
>
> 0(动作类型 0.代理 1.直连),
>
> 0(和上一条相同 动作类型 0.代理 1.直连),
>
> 1(未知),0(未知),
>
> 1(是否可读写 0.可读写 1.只可读),
>
> 0(DNS代理类型 0.自动 1.直连 2.代理),
>
> By-AmazingDM(备注)

其余为路由表。路由表中的每一行为CIDR 地址。以CIDR地址` 222.80.18.0/24 `为例，其中` /24 `为子网前缀长度，这表明该网段下有256个地址。子网前缀长度越小，表明该子网内可用地址越多。

当你获取到游戏所需要用到的IPV4地址，如`xxx.xxx.xxx.xxx`。（说明： IPv4地址是类似 A.B.C.D 的格式，它是32位，用"."分成四段，用10进制表示 ）。如果游戏仅需要与该地址进行通讯，则建议在地址后加上`/32`构成CIDR地址，表示仅代理该ip，如果获取到的地址前三段都相同，而第四段有变化，则建议将第四段改为`.0/24`构成CIDR地址，表示代理该网段下的256个IPV4地址。（SStap是否对IPV6地址支持，目前并不清楚。）

一般来说，获取到单个ip地址就可写为`xxx.xxx.xxx.0/24`。在规则里，并不建议出现小于16的子网前缀长度。



参考：[子网掩码](https://colobu.com/2014/11/12/subnet-mask/)




## 相关手动获取游戏ip的教程

[使用 openQPA 进行基于游戏进程的ip地址获取]( https://github.com/NormanBB/N/blob/master/intro.md )

[ 一个自动获取游戏远程ip，并自动写成SSTAP规则文件的脚本。 ]( https://github.com/oooldtoy/SSTAP_ip_crawl_tool#sstap_ip_crawl_tool )

[利用MMA手动提取加速规则（超不详细）]

[提取加速器规则（超详细）]

## 相关链接 

[解决 Steam/Origin/Uplay/微软商店 等平台下载速度慢的问题](https://go2think.com/usbeam-hosts-editor/)

[基于TypeScript实现的开源SSTap](https://github.com/Srar/node-tap)