% 训练神经网络并且进行仿真预测
% minist数据集下载地址：http://yann.lecun.com/exdb/mnist/
clc
clear 

images = loadMNISTImages('train-images.idx3-ubyte');
labels = loadMNISTLabels('train-labels.idx1-ubyte');

numTrain = numel(labels)*0.001;
numTest  = numel(labels)-numTrain;

% 训练BP神经网络分类
data_Xtrain = images(:,1:numTrain);     %加载训练的输入数据
data_Ytrain = labels(1:numTrain,1)';    %加载训练的输出数据
data_Xtest = images(:,numTrain+1:end);    %加载测试的输入数据
data_Ytest = labels(numTrain+1:end,1)';    %加载测试的输出数据
clear images labels %清除变量，节省内存
%由于系统会优化掉整行全是0的维度，所以对整行全是0的维度首列添加一个趋近于0的数，避免优化
data_Xtrain(~any(data_Xtrain,2),1) = 0.0000001;
data_Xtest(~any(data_Xtest,2),1) = 0.0000001;

% 开始构建BP网络，神经网络内部最自动进行归一化和反归一化
net = feedforwardnet([3,4]);
net = configure(net, data_Xtrain, data_Ytrain);

%设定参数网络参数
net.trainParam.epochs = 100;
net.layers{1}.transferFcn='tansig';    %传递函数
net=init(net);                         %初始化网络参数
net.trainFcn='trainlm';                %训练函数

% 开始训练
net = train(net,data_Xtrain,data_Ytrain);

save net net                %保存训练好的神经网络
Y1 = sim(net,data_Xtest);        %系统自带的计算bp神经网络函数
Y2 = mysim(net,data_Xtest);      %自己写的计算bp神经网络函数
Y3 = MyNet_sim(data_Xtest);      %用于移植的BP神经网络函数
plot(Y-data_Ytest)          %画出误差
