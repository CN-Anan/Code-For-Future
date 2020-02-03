function dataY = mysim(net,dataX)
% 模拟sim函数，含有net数据类型，不能编译为C代码，MyNet_sim，Get_W_B_Ps的合体
% 输入数据分为net训练好的神经网络，dataX为输入向量

%% 获取神经网络参数矩阵
w = cell(net.numLayers,1);b = cell(net.numLayers,1);    %根据神经网络层数申请cell空间

[row,col] = find(net.inputConnect==1);  %获取输入权值矩阵，也就是第一层
     w{1} = net.IW{row,col};
[row,col] = find(net.layerConnect==1);  %获取其他权值矩阵，也就是隐藏层
     for i=1:numel(row)
         w{row(i)} = net.LW{row(i),col(i)};end
[row,col] = find(net.biasConnect==1);   %获取偏差矩阵
     for i=1:numel(row)
         b{row(i)} = net.b{row(i),col(i)};end

% 获取输入数据归一化参数
[row,col] = find(net.inputConnect==1);   %获取输入矩阵
ps_X.xmax = net.inputs{row,col}.range(:,2);
ps_X.xmin = net.inputs{row,col}.range(:,1);
ps_X.ymax = net.inputs{row,col}.processedRange(:,2);
ps_X.ymin = net.inputs{row,col}.processedRange(:,1);

% 获取输出数据归一化参数
[row,col] = find(net.outputConnect==1);   %获取输入矩阵
ps_Y.xmax = net.outputs{row,col}.range(:,2);
ps_Y.xmin = net.outputs{row,col}.range(:,1);
ps_Y.ymax = net.outputs{row,col}.processedRange(:,2);
ps_Y.ymin = net.outputs{row,col}.processedRange(:,1);

%% BP网络的计算过程，参数从上一节获得
% 计算过程如果对同一变量进行赋值，由于每次计算结果的维度不同，数据空间大小发生变化。
% 所以无法直接生成为C代码。解决方法是，提前申请足够长度的cell用于存放每层计算的结果
temp = cell(net.numLayers,1);   %申请cell数组用于存取每一层的计算结果
temp{1} = (dataX-ps_X.xmin)./(ps_X.xmax-ps_X.xmin).*(ps_X.ymax-ps_X.ymin)+ ps_X.ymin;   %归一化数据
for i=2:net.numLayers
    temp{i} = tansig_apply( w{i-1}*temp{i-1}+b{i-1} );    % 前numLayers-1循环计算
end
x = w{net.numLayers}*temp{net.numLayers}+b{net.numLayers};         % 最后一层不使用tansig函数 
dataY = (ps_Y.xmax-ps_Y.xmin).*(x-ps_Y.ymin)./(ps_Y.ymax-ps_Y.ymin)+ps_Y.xmin;   %反归一化
end

function a = tansig_apply(n,~)      %tansig函数，为了能够编译成C
    a = 2 ./ (1 + exp(-2*n)) - 1;
end