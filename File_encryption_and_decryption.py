import os
from tkinter import Tk, filedialog
from sys import argv

model = input('注意：请勿对文件重复加密或解密，导致文件损坏概不负责\n选择模式\n1、加密模式\n2、解密模式\n3、输入其他参数退出程序\n请输入：')

if int(model) == 1:
    default_dir = argv[0].replace('\\', '/')[0:argv[0].replace('\\', '/').rfind('/')]  # 获取当前执行文件的路径
    root = Tk()  # 创建一个Tkinter.Tk()实例
    root.withdraw()  # 将Tkinter.Tk()实例隐藏
    print('文件加密\n请选择密钥文件(图片)：')
    KeyImgName = filedialog.askopenfilename(title='选择密钥文件(图片)', initialdir=default_dir)
    print(KeyImgName + '\n请选择要加密的文件:')
    filename = filedialog.askopenfilename(title='选择加密文件', initialdir=default_dir)
    input(filename + '\n按任意键开始文件加密...')

    if KeyImgName != '' and filename != '':
        print('正在加密...')
        suffix = filename[filename.rfind('.'):].ljust(10, ' ')  # 生成后缀
        with open(KeyImgName, 'rb') as file:  # 二进制格式读取密钥
            key = file.read()

        with open(filename, 'rb') as file:  # 二进制格式读取文件
            str = file.read()

        with open(filename, 'wb') as file:  # 将图片密钥和文件格式写入文件
            file.write(key)  # 最前面写入图片密钥
            file.write(suffix.encode())  # 写入五个字符的格式，方便解密重命名
            file.write(str)  # 写入文件内容

        os.rename(filename, filename[:filename.rfind('.')] + KeyImgName[KeyImgName.rfind('.'):])  # 重命名
        input('文件加密完成，按任意键结束进程...')
    else:
        input('文件选择有误，按任意键结束进程...')

elif int(model) == 2:
    default_dir = argv[0].replace('\\', '/')[0:argv[0].replace('\\', '/').rfind('/')]  # 获取当前执行文件的路径
    root = Tk()  # 创建一个Tkinter.Tk()实例
    root.withdraw()  # 将Tkinter.Tk()实例隐藏
    print('文件解密\n请选择密钥文件(图片)：')
    KeyImgName = filedialog.askopenfilename(title='选择密钥文件(图片)', initialdir=default_dir)
    print(KeyImgName + '\n请选择要解密的文件:')
    filename = filedialog.askopenfilename(title='选择加密文件', initialdir=default_dir)
    input(filename + '\n按任意键开始文件解密...')
    if KeyImgName != '' and filename != '':
        print('正在解密...')
        with open(KeyImgName, 'rb') as file:  # 二进制格式读取密钥
            key = file.read()

        with open(filename, 'rb') as file:  # 二进制格式读取文件
            file.read(len(key))  # 跳过图片密钥
            suffix = file.read(10).decode()  # 生成后缀
            str = file.read()  # 读取文件

        with open(filename, 'wb') as file:  # 将图片密钥和文件格式写入文件
            file.write(str)

        os.rename(filename, filename[:filename.rfind('.')] + suffix)  # 重命名
        input('文件解密完成，按任意键结束进程...')
    else:
        input('文件选择有误，按任意键结束进程...')
else:
    input('检测到输入为:' + model + '，请按任意键结束进程...')
