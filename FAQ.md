# 常见问题



## SSTap越用内存占用越大，甚至死机?

在首页的点我下载中下载无广告的1.0.9.7版本的SStap。

## SSTap打开的时候提示脚本错误

[![PnuzEF.png](https://s1.ax1x.com/2018/07/10/PnuzEF.png)](https://imgchr.com/i/PnuzEF)  

如上图所示，打开的时候提示这个错误

SSTap加载Google广告的时候页面出现错误，但点是或否都没关系，软件是正常工作的.

## SSTap打开的时候，后台有莫名的音乐声音？

我中病毒了!?  
这是由于SSTap里面的Google广告会根据个人广告ID推送的广告，刚好里面会有音乐的。    
解决办法:  
就是在**任务栏**里面找到音量图标，打开音量合成器，在SSTap的图标选择静音该程序即可.

## Win10 开启代理后 CPU 占用很高，导致电脑很卡

这是由一个 Win10 的一个网络检测服务所致，且一般发生在网络适配器开启了 IPv6 协议的情况下，SSTap 虚拟网卡创建的连接由于没有 IPv6 而被误认为是受限网络从而触发了检测。（大概）    
解决方案：  
打开任务管理器，根据 CPU 占用排序找到网络受限的那个进程，右击结束即可
如果您不使用或当前网络环境没有 IPv6，可以将网络适配器属性中的 IPv6 取消打勾。 By [神代綺凜](https://moe.best/)

## 规则无法使用！

[![加入 Telegram 群组](https://img.shields.io/badge/%E5%8A%A0%E5%85%A5-Telegram_%E7%BE%A4%E7%BB%84-brightgreen.svg)](https://t.me/SSTapRule)

请加入我们的 Telegram 群组，或者开 [issue](https://github.com/FQrabbit/SSTap-Rule/issues/new/choose) 反馈问题。




