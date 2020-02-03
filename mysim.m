function dataY = mysim(net,dataX)
% ģ��sim����������net�������ͣ����ܱ���ΪC���룬MyNet_sim��Get_W_B_Ps�ĺ���
% �������ݷ�Ϊnetѵ���õ������磬dataXΪ��������

%% ��ȡ�������������
w = cell(net.numLayers,1);b = cell(net.numLayers,1);    %�����������������cell�ռ�

[row,col] = find(net.inputConnect==1);  %��ȡ����Ȩֵ����Ҳ���ǵ�һ��
     w{1} = net.IW{row,col};
[row,col] = find(net.layerConnect==1);  %��ȡ����Ȩֵ����Ҳ�������ز�
     for i=1:numel(row)
         w{row(i)} = net.LW{row(i),col(i)};end
[row,col] = find(net.biasConnect==1);   %��ȡƫ�����
     for i=1:numel(row)
         b{row(i)} = net.b{row(i),col(i)};end

% ��ȡ�������ݹ�һ������
[row,col] = find(net.inputConnect==1);   %��ȡ�������
ps_X.xmax = net.inputs{row,col}.range(:,2);
ps_X.xmin = net.inputs{row,col}.range(:,1);
ps_X.ymax = net.inputs{row,col}.processedRange(:,2);
ps_X.ymin = net.inputs{row,col}.processedRange(:,1);

% ��ȡ������ݹ�һ������
[row,col] = find(net.outputConnect==1);   %��ȡ�������
ps_Y.xmax = net.outputs{row,col}.range(:,2);
ps_Y.xmin = net.outputs{row,col}.range(:,1);
ps_Y.ymax = net.outputs{row,col}.processedRange(:,2);
ps_Y.ymin = net.outputs{row,col}.processedRange(:,1);

%% BP����ļ�����̣���������һ�ڻ��
% ������������ͬһ�������и�ֵ������ÿ�μ�������ά�Ȳ�ͬ�����ݿռ��С�����仯��
% �����޷�ֱ������ΪC���롣��������ǣ���ǰ�����㹻���ȵ�cell���ڴ��ÿ�����Ľ��
temp = cell(net.numLayers,1);   %����cell�������ڴ�ȡÿһ��ļ�����
temp{1} = (dataX-ps_X.xmin)./(ps_X.xmax-ps_X.xmin).*(ps_X.ymax-ps_X.ymin)+ ps_X.ymin;   %��һ������
for i=2:net.numLayers
    temp{i} = tansig_apply( w{i-1}*temp{i-1}+b{i-1} );    % ǰnumLayers-1ѭ������
end
x = w{net.numLayers}*temp{net.numLayers}+b{net.numLayers};         % ���һ�㲻ʹ��tansig���� 
dataY = (ps_Y.xmax-ps_Y.xmin).*(x-ps_Y.ymin)./(ps_Y.ymax-ps_Y.ymin)+ps_Y.xmin;   %����һ��
end

function a = tansig_apply(n,~)      %tansig������Ϊ���ܹ������C
    a = 2 ./ (1 + exp(-2*n)) - 1;
end