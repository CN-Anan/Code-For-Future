%   ˵��������Ƶ�ļ���Ե��������µ���Ƶ�ļ�
%   ���ߣ�Jason
%   ʱ�䣺2019/8/9
%   ����汾��MATLAB 2016a
%   �ο��ĵ����ӣ�
%   https://www.mathworks.com/help/vision/ref/vision.videofilereader-system-object.html
%   https://www.mathworks.com/help/vision/ref/vision.videofilewriter-system-object.html

clear;
clc;
tic;    %��ʼ��ʱ
InPath='C:\Users\10926\Desktop\matlab��Ե������\MRY.mp4';   %�ļ�·��
OutPath=strcat( strtok(InPath,'.'), 'New.avi');   %���·�����ļ�������β������  .avi
audio_file = audioread(InPath);     %��ȡԭ��Ƶ��Ƶ
videoFReader = vision.VideoFileReader(InPath);   %��ȡԭ��Ƶͼ��

%�½���Ƶ�ļ���֡�ʱ��ֲ��䣬������Ƶ����
videoFWriter = vision.VideoFileWriter(OutPath, 'AudioInputPort',true,...
                                               'FrameRate',videoFReader.info.VideoFrameRate,...
                                               'VideoCompressor','MJPEG Compressor');%ѹ��������                              
nFrames = VideoReader(InPath).NumberOfFrames; %��ȡ��Ƶ��֡��   
val = size(audio_file,1)/nFrames;%����ÿһ֡����Ƶ���ݳ���

%ÿһ֡��ͼ��������Ƶ��Ƶ�ϳ�
for k=1:nFrames
    videoFrame = step(videoFReader);    %��ȡ��ǰ֡
    videoFrame = rgb2gray(videoFrame);  %ת��Ϊ�Ҷ�ͼ
    videoFrame = edge(videoFrame,'log',[],2.1); %ʹ��log���ӱ�Ե���
    videoFrame = im2double(~videoFrame);    %ת��Ϊͼ��
    step(videoFWriter, videoFrame, audio_file( fix( val*(k-1)+1:val*k ), : ));%�ϳ���Ƶ
    fprintf('��ǰ���ȣ�%.3f %%����ǰ��ʱ��%.2f����\n',k/nFrames*100,toc/60);%��ʾ�ܽ��Ⱥ�ʱ�䣬����Ҫ����ע�͵�
end
release(videoFReader);%�ر�ԭ��Ƶ�ļ�
release(videoFWriter);%�ر�ת�������Ƶ�ļ�
fprintf('�ܹ���ʱ%.2f����\n',toc/60);