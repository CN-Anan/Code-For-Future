function [w,b,ps_X,ps_Y] = Get_W_B_Ps(net)   
% 通过该函数获取神经网络参数，归一化参数,将得到的参数复制进入MyNet_sim.m文件内
% 含有net数据类型，不能编译为C代码
% 输入数据，net为训练好的神经网络

%% 获取神经网络参数矩阵
w = cell(net.numLayers,1);b = cell(net.numLayers,1);    %根据神经网络层数申请cell空间

[row,col] = find(net.inputConnect==1);  %获取输入权值矩阵，也就是第一层
w{1} = net.IW{row,col};

[row,col] = find(net.layerConnect==1);  %获取其他权值矩阵，也就是隐藏层
for i=1:numel(row)
    w{row(i)} = net.LW{row(i),col(i)};
end

[row,col] = find(net.biasConnect==1);   %获取偏差矩阵位置
for i=1:numel(row)
    b{row(i)} = net.b{row(i),col(i)};
end

% 获取输入数据归一化参数
[row,col] = find(net.inputConnect==1);   %获取输入数据归一化参数在矩阵中的位置
ps_X.xmax = net.inputs{row,col}.range(:,2);
ps_X.xmin = net.inputs{row,col}.range(:,1);
ps_X.ymax = net.inputs{row,col}.processedRange(:,2);
ps_X.ymin = net.inputs{row,col}.processedRange(:,1);

% 获取输出数据归一化参数
[row,col] = find(net.outputConnect==1);   %获取输出数据归一化参数在矩阵中的位置
ps_Y.xmax = net.outputs{row,col}.range(:,2);
ps_Y.xmin = net.outputs{row,col}.range(:,1);
ps_Y.ymax = net.outputs{row,col}.processedRange(:,2);
ps_Y.ymin = net.outputs{row,col}.processedRange(:,1);
end