> [https://github.com/FQrabbit/SSTap-Rule/issues/222](https://github.com/FQrabbit/SSTap-Rule/issues/222)

# 利用MMA手动提取加速规则（超不详细）

## 0. 环境需求

- **OS:** Windows 10 , Windows 7, Windows 8, Windows 8.1, Windows Server 2008 R2, Windows Server 2012, Windows Server 2012 R2, Windows Server 2016
- **Redistributables:** Minimum: .NET Framework 4.5
- **Display Resolution:** 1024 x 768 or above
- **Hard disk space: Install:** Minimum: 350MB; Capturing and loading traces: Recommended: 50GB
- **RAM:** 64-bit: Minimum: 2GB, Recommended: 8GB; 32-bit: Minimum: 2GB
- **CPU:** Minimum: 1.4 GHz, Recommended: 2 x 2.80 GHz (64-bit)

## 1. 下载MMA

[Microsoft Message Analyzer](https://www.microsoft.com/en-us/download/details.aspx?id=44226)

## 2. SSTap开启全局或绕过中国IP模式启动

![](https://i.loli.net/2019/04/12/5cb03a7e8a3b9.jpg)

## 3. 以管理员权限运行MMA，启动新的Local Trace

![](https://i.loli.net/2019/04/12/5cb03af4d8b6a.png)

## 4. Group ProcessName

在表头处右键，Add Column，然后在弹出的界面中搜索ProcessName并添加

右键ProcessName，点击Group

![](https://i.loli.net/2019/04/12/5cb03b1a1d2b8.png)

## 5. 玩游戏

玩就是了，不多做解释。

如果有多个数据中心，建议都切换一次。

## 6. 提取规则

打开游戏对应的Process与SSTap的Process，记录每个请求的Destination列的内容

如果是

- IP（`***.***.***.***`）: 直接添加一条`***.***.***.0/24`的规则（小白行为，如有问题请dalao指正）
- 域名（`some.domain.com`）: 去某[节点测试](<http://ping.chinaz.com/>)的网站测试域名，测试完毕后将所有IP按照上一条添加为规则

**请注意，不要添加保留/私有IP地址与你的梯子的IP地址。**

## Moreover

1. DNS污染的域名可以通过hosts处理（或者用sstap处理DNS？
2. 貌似wiki不能PR，提个issue好了（