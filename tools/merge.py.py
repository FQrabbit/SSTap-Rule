file_path = "Apex.rules"
_file_path = "1.rules"

def open_ru(path):
    with open(path, "r") as file:
        temp = file.readline()
        data_list = []
        while True:
            data = file.readline().split("\n")
            if len(data) == 1:
                break
            data_list.append(data[0])
    return data_list

def slist(list:list, data):
    for i in list:
        if i == data:
            return True
    return False

def gengx(path, data:list):
    with open(path, "a", encoding='utf-8') as gengx:
        for i in data:
            gengx.write(i+"\n")


if __name__ == "__main__":
    file_path = str(input("输入需要更新文件:")) 
    _file_path = str(input("输入最新文件名:")) 
    

    yuan_list = open_ru(file_path)
    geng_list = open_ru(_file_path)
    gengx_list = []
    for i in geng_list:
        if slist(yuan_list, i):
            pass
        else:
            print(f'添加: {i}')
            gengx_list.append(i)
    gengx(file_path, gengx_list)

    print(f'更新结束 共:{len(gengx_list)}条')
