function [w,b,ps_X,ps_Y] = Get_W_B_Ps(net)   
% ͨ���ú�����ȡ�������������һ������,���õ��Ĳ������ƽ���MyNet_sim.m�ļ���
% ����net�������ͣ����ܱ���ΪC����
% �������ݣ�netΪѵ���õ�������

%% ��ȡ�������������
w = cell(net.numLayers,1);b = cell(net.numLayers,1);    %�����������������cell�ռ�

[row,col] = find(net.inputConnect==1);  %��ȡ����Ȩֵ����Ҳ���ǵ�һ��
w{1} = net.IW{row,col};

[row,col] = find(net.layerConnect==1);  %��ȡ����Ȩֵ����Ҳ�������ز�
for i=1:numel(row)
    w{row(i)} = net.LW{row(i),col(i)};
end

[row,col] = find(net.biasConnect==1);   %��ȡƫ�����λ��
for i=1:numel(row)
    b{row(i)} = net.b{row(i),col(i)};
end

% ��ȡ�������ݹ�һ������
[row,col] = find(net.inputConnect==1);   %��ȡ�������ݹ�һ�������ھ����е�λ��
ps_X.xmax = net.inputs{row,col}.range(:,2);
ps_X.xmin = net.inputs{row,col}.range(:,1);
ps_X.ymax = net.inputs{row,col}.processedRange(:,2);
ps_X.ymin = net.inputs{row,col}.processedRange(:,1);

% ��ȡ������ݹ�һ������
[row,col] = find(net.outputConnect==1);   %��ȡ������ݹ�һ�������ھ����е�λ��
ps_Y.xmax = net.outputs{row,col}.range(:,2);
ps_Y.xmin = net.outputs{row,col}.range(:,1);
ps_Y.ymax = net.outputs{row,col}.processedRange(:,2);
ps_Y.ymin = net.outputs{row,col}.processedRange(:,1);
end