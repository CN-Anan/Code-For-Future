# -*- coding: utf-8 -*-
# @Time    : 2020/7/6 11:44
# @Author  : Jason
# @File    : main.py

# 批量卸载python包（卸载除pip和setuptools以外的所有包）
# 物理环境卸载方式：cmd中直接使用python运行该文件（python UninstallPackages.py）
# 虚拟环境卸载方式：1、cmd中进入相应的python虚拟环境,即命令行之前出现（yourvenv）
#                2、使用python运行该文件（python UninstallPackages.py）
# 其他卸载方式：1、IDE中运行该代码直接卸载当前环境的包

import os
packages = os.popen('pip list').read()
print('当前虚拟环境存在的包：\n'+packages)
packages = packages.split('\n')[2:-1]
for package in packages:
    package = package[0:package.find(' ')]
    if package != 'pip' and package != 'setuptools':
        print('\n即将卸载的包：'+package)
        os.system("@echo y | pip uninstall "+package)