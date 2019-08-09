%   说明：将视频文件边缘检测后输出新的视频文件
%   作者：Jason
%   时间：2019/8/9
%   软件版本：MATLAB 2016a
%   参考文档链接：
%   https://www.mathworks.com/help/vision/ref/vision.videofilereader-system-object.html
%   https://www.mathworks.com/help/vision/ref/vision.videofilewriter-system-object.html

clear;
clc;
tic;    %开始计时
InPath='C:\Users\10926\Desktop\matlab边缘检测代码\MRY.mp4';   %文件路径
OutPath=strcat( strtok(InPath,'.'), 'New.avi');   %输出路径和文件名，结尾必须是  .avi
audio_file = audioread(InPath);     %获取原视频音频
videoFReader = vision.VideoFileReader(InPath);   %获取原视频图像

%新建视频文件，帧率保持不变，允许音频输入
videoFWriter = vision.VideoFileWriter(OutPath, 'AudioInputPort',true,...
                                               'FrameRate',videoFReader.info.VideoFrameRate,...
                                               'VideoCompressor','MJPEG Compressor');%压缩编码器                              
nFrames = VideoReader(InPath).NumberOfFrames; %获取视频总帧数   
val = size(audio_file,1)/nFrames;%计算每一帧的音频数据长度

%每一帧的图像处理与音频视频合成
for k=1:nFrames
    videoFrame = step(videoFReader);    %获取当前帧
    videoFrame = rgb2gray(videoFrame);  %转化为灰度图
    videoFrame = edge(videoFrame,'log',[],2.1); %使用log算子边缘检测
    videoFrame = im2double(~videoFrame);    %转化为图像
    step(videoFWriter, videoFrame, audio_file( fix( val*(k-1)+1:val*k ), : ));%合成视频
    fprintf('当前进度：%.3f %%，当前用时：%.2f分钟\n',k/nFrames*100,toc/60);%显示总进度和时间，不需要可以注释掉
end
release(videoFReader);%关闭原视频文件
release(videoFWriter);%关闭转化后的视频文件
fprintf('总共用时%.2f分钟\n',toc/60);