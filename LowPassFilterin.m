%   说明：音频理想低通滤波处理
%   作者：Jason
%   时间：2019/8/11
%   软件版本：MATLAB 2016a
%   演示视频：

clear;
clc;
tic;    %开始计时

InPath='C:\Users\10926\Desktop\青藏高原清唱.mp4';   %文件路径
OutPath=strcat( strtok(InPath,'.'), 'New2.avi');   %输出路径和文件名，结尾必须是  .avi
[audio_file,Fs] = audioread(InPath);     %获取原视频音频
videoFReader = vision.VideoFileReader(InPath);   %获取原视频图像

%新建视频文件，帧率保持不变，允许音频输入
videoFWriter = vision.VideoFileWriter(OutPath, 'AudioInputPort',true,...
                                               'FrameRate',videoFReader.info.VideoFrameRate,...
                                               'VideoCompressor','MJPEG Compressor');%压缩编码器                              
nFrames = VideoReader(InPath).NumberOfFrames; %获取视频总帧数   
val = size(audio_file,1)/nFrames;%计算每一帧的音频数据长度

FFT_Audio1 = fft(audio_file(:,1)); %声道1傅里叶变换
FFT_Audio2 = fft(audio_file(:,2)); %声道2傅里叶变换
f = linspace(0,Fs,length(FFT_Audio1)); %频域横坐标

subplot(2,1,1);
plot(f,abs(FFT_Audio1)); %原音频频谱
axis([0 Fs/2 0 6000]);
title('滤波前幅频特性图');%标题
xlabel('f（Hz）')%x轴标记
 
%理想低通滤波，去除声音中的高频成分
CutOff_f = 900;  %低通滤波截止频率
for i=1:length(FFT_Audio1)
    if f(i) > CutOff_f &&  f(i) < Fs-CutOff_f
        FFT_Audio1(i)=0;
        FFT_Audio2(i)=0;
    end
end
