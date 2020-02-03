% ѵ�������粢�ҽ��з���Ԥ��
clc
clear 

images = loadMNISTImages('train-images.idx3-ubyte');
labels = loadMNISTLabels('train-labels.idx1-ubyte');

numTrain = numel(labels)*0.001;
numTest  = numel(labels)-numTrain;

% ѵ��BP���������
data_Xtrain = images(:,1:numTrain);     %����ѵ������������
data_Ytrain = labels(1:numTrain,1)';    %����ѵ�����������
data_Xtest = images(:,numTrain+1:end);    %���ز��Ե���������
data_Ytest = labels(numTrain+1:end,1)';    %���ز��Ե��������
clear images labels %�����������ʡ�ڴ�
%����ϵͳ���Ż�������ȫ��0��ά�ȣ����Զ�����ȫ��0��ά���������һ��������0�����������Ż�
data_Xtrain(~any(data_Xtrain,2),1) = 0.0000001;
data_Xtest(~any(data_Xtest,2),1) = 0.0000001;

% ��ʼ����BP���磬�������ڲ����Զ����й�һ���ͷ���һ��
net = feedforwardnet([3,4]);
net = configure(net, data_Xtrain, data_Ytrain);

%�趨�����������
net.trainParam.epochs = 100;
net.layers{1}.transferFcn='tansig';    %���ݺ���
net=init(net);                         %��ʼ���������
net.trainFcn='trainlm';                %ѵ������

% ��ʼѵ��
net = train(net,data_Xtrain,data_Ytrain);

save net net                %����ѵ���õ�������
Y1 = sim(net,data_Xtest);        %ϵͳ�Դ��ļ���bp�����纯��
Y2 = mysim(net,data_Xtest);      %�Լ�д�ļ���bp�����纯��
Y3 = MyNet_sim(data_Xtest);      %������ֲ��BP�����纯��
plot(Y-data_Ytest)          %�������
