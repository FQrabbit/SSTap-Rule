# 导入正则表达式模块
import re

# IP 地址的文件名
filename = "ip.txt"

# 将 IP 地址和掩码位数转换为 CIDR 格式的函数
def convert_ip_to_cidr(ip, mask_bits):
    ip_parts = ip.split('.')
    new_ip = f"{ip_parts[0]}.{ip_parts[1]}.0.0" #如果掩码位数改成24，就把前面0改成{ip_parts[2]}，以此类推
    return f"{new_ip}/{mask_bits}"
# 设置掩码位数为 16
mask_bits = 16

# IP 地址匹配的正则表达式模式
pattern = r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'

# 读取文本文件
with open(filename, 'r', encoding='utf-8') as file:
    # 读取文件内容
    contents = file.read()
    # 使用正则表达式提取所有 IP 地址
    ip_addresses = re.findall(pattern, contents)

# 使用列表推导式将每个 IP 地址转换为 CIDR 格式
converted_ips = [convert_ip_to_cidr(ip, mask_bits) for ip in ip_addresses]

# 去除重复项
unique_converted_ips = list(set(converted_ips))

# 对结果进行排序
unique_converted_ips.sort()

# 去重的 CIDR 格式 IP 地址并打印到控制台
for cidr_ip in unique_converted_ips:
    print(cidr_ip)