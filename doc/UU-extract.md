# 提取加速器规则（超详细）
 > 小白教程 大佬勿喷

**此教程所使用加速器为UU加速器针对使用虚拟网卡的加速，其他有PPTP或者OpenVPN、l2tp模式的加速器提取方式相同(只要可以搞到路由信息就OK;D)，新用户拥有3天免费试用。**

现已知`UU加速器(模式1、2、3) 腾讯加速器(模式1)`可提取路由信息

![腾讯加速器](https://jiasu.qq.com/images/xb/jiasulogo.png)

![UU](https://uu.res.netease.com/pc/gw/20180820194744/img/logo_10355c2.png)

UU加速模式科普

(1)pptp使用简单方便，不需要做额外配置，连接、断开的速度快，要求防火墙、路由器支持，对网络环境要求比较高。而l2tp需要共享密钥和修改注册表（对win系列机器讲）

(2)l2tp在穿透方面有时候会比pptp强一些， 有一定的网络防闪断能力。适合pptp不能用的环境 OpenVPN穿透能力最强。

(3)OpenVPN：穿透能力最强，适合校园网、公司局域网等受限网络环境，第一次使用要安装虚拟网卡。

(4)LSP:是现在网游加速的主流加速技术，因其可维护性高，受到具备较好的研发能力的网游加速器团队的喜爱。并且LSP能够做到比VPN这种传统代理技术更高的灵活性，同时也能够提供更好的加速效果，同样适合适合校园网、公司局域网等受限网络环境

# 正片：
## 1. 首先得有一个UU VIP账号不然无法提取外服规则
![](https://i.loli.net/2018/12/13/5c11fbffae8da.png)

## 2.找到需要提取的游戏，下面以CSGO为示例

* 选择好游戏后点击节点里面可以选择加速模式

![](https://i.loli.net/2018/12/13/5c11fd186475c.png)

* 如图 找到模式选择 勾上模式1.2.3

``注意有些游戏这里可能会出现没有节点可选的情况,这种情况说明UU还没有适配此游戏的路由规则，可以放弃了23333``

![](https://i.loli.net/2018/12/27/5c2432de45f25.png)

## 3.选择节点加速成功后打开 CMD(Win+R输入CMD打开,无需管理员权限) 和 [路由转SSTAP规则工具](https://ittuann.github.io/Route2CIDR/)

在CMD里找好目录后输入以下命令将路由信息输出到文件

`route print -4 >> route.txt `

![](https://i.loli.net/2018/12/13/5c11ffa3cf025.png)

![](https://i.loli.net/2018/12/13/5c11ff455a0c7.png)

成功在D盘目录下获取route.txt一枚,大概长这样会有一堆显示 `在链路上` 的IP，这些就是我们需要转换的IP了（模式三则是虚拟网卡接口IP）

![](https://i.loli.net/2018/12/31/5c2a2cc931852.png)

将内容复制到 [路由转SSTAP规则工具](https://ittuann.github.io/Route2CIDR/) 进行转换

![Route2CIDR.png](https://s2.loli.net/2024/08/18/bq3FmMJxGzpUyXn.png)

## 4.把转换后右边输出的一堆东西复制下来在SSTAP根目录rules文件夹新建一个xxx.rules的文件并完善相关信息

![](https://i.loli.net/2018/12/13/5c1200f4b89b0.png)

(PS:当然你也可以直接在SSTap中使用UI界面添加规则

![](https://s2.ax1x.com/2019/03/21/A3kQa9.png)

将复制到的东西粘贴进去，然后在第一行写上SSTAP规则头，一个你没玩过的船新版本就完成了，重启SSTAP即可看到规则。



**PS:如教程有问题或者其他修改建议请联系[@AmazingDM](https://github.com/AmazingDM) 或者发起[issues](https://github.com/FQrabbit/SSTap-Rule/issues),记得在[issues](https://github.com/FQrabbit/SSTap-Rule/issues)里附上无法转换的route.txt所有内容以及加速器名称、加速模式名称、游戏名称。**

如遇到无法转换或转换无反应结果为空，请检查当前加速模式是否为教程所示的3种模式

注：[转换工具](https://ittuann.github.io/Route2CIDR/)将过滤所有[保留IP](https://zh.wikipedia.org/wiki/%E4%BF%9D%E7%95%99IP%E5%9C%B0%E5%9D%80)，转换失败后可自行对比route.txt里的IP。出现无法访问请挂代理。 ;D



**教程所有内容仅供研究学习使用，不得用于任何商业用途。**

**Use it on your own risk!**

