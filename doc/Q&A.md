# Q&A

1. 如何判断当前代理成功?

访问 [查询本机 IP 地址及归属地](https://ip.skk.moe/)

![](./ip_test.png)

图中国内显示本机IP，国外显示代理IP，下方网站访问检查显示正常，即为代理成功。

![](./bilibili_result.png)

B站观看也走了国内的CDN。

![](./unbound_log.png)

分析DNS解析可知，国内查询走国内DNS，国外查询走国外DNS。

关于 unbound 的其余用法，可自行修改配置文件。