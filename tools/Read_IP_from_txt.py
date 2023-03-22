# 导入正则表达式模块
import re

# IP 地址的文件名
filename = "ip.txt"

# 正则表达式模式匹配IP地址
pattern = r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'

# 读取文本文件
with open(filename, 'r', encoding='utf-8') as file:
    # 读取文件内容
    contents = file.read()
    # 在文件内容中查找匹配的 IP 地址
    ip_addresses = re.findall(pattern, contents)
    # 打印提取到的 IP 地址到控制台
    for ip in ip_addresses:
        print(ip)