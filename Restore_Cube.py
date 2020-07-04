# -*- coding: utf-8 -*-
# @Time    : 2020/7/3 18:48
# @Author  : Jason
# @File    : main.py
# 浏览器插件：Rubik's Cube
# 例程视频https://space.bilibili.com/27673468

import pyautogui
import kociemba

# 指定颜色每个色块的位置
Pos_U = [(479,337),(573,388),(655,431),
         (390,394),(480,443),(575,498),
         (294,447),(393,479),(482,542)]

Pos_F = [(253,520),(330,570),(430,620),
         (253,620),(330,670),(430,720),
         (253,720),(330,770),(430,820)]

Pos_R = [(530,620),(620,570),(710,520),
         (530,720),(620,670),(710,620),
         (530,820),(620,770),(710,720)]

# 执行转动魔方的指令
def LeftDrag():
    pyautogui.moveTo(570, 950)
    pyautogui.dragTo(390, 950, 0.2, button='left')

def RightDrag():
    pyautogui.moveTo(390, 950)
    pyautogui.dragTo(570, 950, 0.2, button='left')

def UpDrag():
    pyautogui.moveTo(140, 650)
    pyautogui.dragTo(140, 500, 0.2, button='left')

def DownDrag():
    pyautogui.moveTo(140, 500)
    pyautogui.dragTo(140, 650, 0.2, button='left')

def L():
    pyautogui.moveTo(253,520)
    pyautogui.dragTo(253,720, 0.2, button='left')
def L_r():
    pyautogui.moveTo(253, 720)
    pyautogui.dragTo(253, 520, 0.2, button='left')

def R():
    pyautogui.moveTo(430,820)
    pyautogui.dragTo(430,620, 0.2, button='left')
def R_r():
    pyautogui.moveTo(430,620)
    pyautogui.dragTo(430,820, 0.2, button='left')

def U():
    pyautogui.moveTo(430,620)
    pyautogui.dragTo(253,520, 0.2, button='left')
def U_r():
    pyautogui.moveTo(253,520)
    pyautogui.dragTo(430,620, 0.2, button='left')

def D():
    pyautogui.moveTo(253,720)
    pyautogui.dragTo(430,820, 0.2, button='left')
def D_r():
    pyautogui.moveTo(430,820)
    pyautogui.dragTo(253,720, 0.2, button='left')

def F():
    pyautogui.moveTo(294,447)
    pyautogui.dragTo(482,542, 0.2, button='left')
def F_r():
    pyautogui.moveTo(482,542)
    pyautogui.dragTo(294,447, 0.2, button='left')

def B():
    pyautogui.moveTo(655,431)
    pyautogui.dragTo(479,337, 0.2, button='left')
def B_r():
    pyautogui.moveTo(479,337)
    pyautogui.dragTo(655,431, 0.2, button='left')

# 比较两个颜色，相同颜色返回True，不同颜色返回False
def CompareColor(color1,color2):
    value = 0
    for i in range(3):
        value = value + pow(pow(color1[i]-color2[i],2),0.5)
    if value<10:
        return True
    else:
        return False

# 生成魔方代码
def GenerateCmd(Color):
    global cmd
    for i in range(9):
        if CompareColor(Color[i], Color_U[4]) is True:
            cmd = cmd + 'U'
        elif CompareColor(Color[i], Color_R[4]) is True:
            cmd = cmd + 'R'
        elif CompareColor(Color[i], Color_F[4]) is True:
            cmd = cmd + 'F'
        elif CompareColor(Color[i], Color_D[4]) is True:
            cmd = cmd + 'D'
        elif CompareColor(Color[i], Color_L[4]) is True:
            cmd = cmd + 'L'
        elif CompareColor(Color[i], Color_B[4]) is True:
            cmd = cmd + 'B'

# 识别魔方颜色
Color_U = []
Color_F = []
Color_R = []
Color_D = []
Color_B = []
Color_L = []
for i in range(9):
    Color_F.append(pyautogui.pixel(Pos_F[i][0], Pos_F[i][1]))
DownDrag()
for i in range(9):
    Color_U.append(pyautogui.pixel(Pos_F[i][0], Pos_F[i][1]))
UpDrag()
UpDrag()
for i in range(9):
    Color_D.append(pyautogui.pixel(Pos_F[i][0], Pos_F[i][1]))
DownDrag()
RightDrag()
for i in range(9):
    Color_L.append(pyautogui.pixel(Pos_F[i][0], Pos_F[i][1]))
RightDrag()
for i in range(9):
    Color_B.append(pyautogui.pixel(Pos_F[i][0], Pos_F[i][1]))
RightDrag()
for i in range(9):
    Color_R.append(pyautogui.pixel(Pos_F[i][0], Pos_F[i][1]))
RightDrag()

# 生成魔法代码
cmd = ''
GenerateCmd(Color_U)
GenerateCmd(Color_R)
GenerateCmd(Color_F)
GenerateCmd(Color_D)
GenerateCmd(Color_L)
GenerateCmd(Color_B)

# 解算魔方还原步骤
ans = kociemba.solve(cmd)
step = ans.split(' ')
print("还原魔方共需要"+str(len(step))+"步\n还原代码为："+ans)
# 执行魔方还原
for i in range(len(step)):
    if step[i] == "L":
        L()
    elif step[i] == "L2":
        L()
        L()
    elif step[i] == "L'":
        L_r()

    elif step[i] == "R":
        R()
    elif step[i] == "R2":
        R()
        R()
    elif step[i] == "R'":
        R_r()

    elif step[i] == "U":
        U()
    elif step[i] == "U2":
        U()
        U()
    elif step[i] == "U'":
        U_r()

    elif step[i] == "D":
        D()
    elif step[i] == "D2":
        D()
        D()
    elif step[i] == "D'":
        D_r()

    elif step[i] == "F":
        F()
    elif step[i] == "F2":
        F()
        F()
    elif step[i] == "F'":
        F_r()

    elif step[i] == "B":
        B()
    elif step[i] == "B2":
        B()
        B()
    elif step[i] == "B'":
        B_r()
