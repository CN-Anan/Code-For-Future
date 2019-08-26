function varargout = boom(varargin)
% BOOM MATLAB code for boom.fig
%      BOOM, by itself, creates a new BOOM or raises the existing
%      singleton*.
%
%      H = BOOM returns the handle to a new BOOM or the handle to
%      the existing singleton*.
%
%      BOOM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BOOM.M with the given input arguments.
%
%      BOOM('Property','Value',...) creates a new BOOM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before boom_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to boom_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help boom

% Last Modified by GUIDE v2.5 21-Jul-2019 16:41:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @boom_OpeningFcn, ...
                   'gui_OutputFcn',  @boom_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before boom is made visible.
function boom_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to boom (see VARARGIN)
global StartFlag TimeCount;
StartFlag=0;  %开始游戏标志，为1时才能开始游戏
TimeCount=0;  %开始游戏之前，不计数
for i=0:99  %初始化棋盘
    eval(['set(handles.xy',num2str(i), ',''string'','' '');']);
end

%定时器1

handles.timer1=timer;
set(handles.timer1,'Execution','FIxedRate');
set(handles.timer1,'Period',1);
set(handles.timer1,'TimerFcn',{@Timer1,handles});
start(handles.timer1);

% Choose default command line output for boom
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes boom wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = boom_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in xy0.
function xy0_Callback(hObject, eventdata, handles)
% hObject    handle to xy0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy1.
function xy1_Callback(hObject, eventdata, handles)
% hObject    handle to xy1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy2.
function xy2_Callback(hObject, eventdata, handles)
% hObject    handle to xy2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy3.
function xy3_Callback(hObject, eventdata, handles)
% hObject    handle to xy3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy4.
function xy4_Callback(hObject, eventdata, handles)
% hObject    handle to xy4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy5.
function xy5_Callback(hObject, eventdata, handles)
% hObject    handle to xy5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy6.
function xy6_Callback(hObject, eventdata, handles)
% hObject    handle to xy6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy7.
function xy7_Callback(hObject, eventdata, handles)
% hObject    handle to xy7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy8.
function xy8_Callback(hObject, eventdata, handles)
% hObject    handle to xy8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy9.
function xy9_Callback(hObject, eventdata, handles)
% hObject    handle to xy9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy10.
function xy10_Callback(hObject, eventdata, handles)
% hObject    handle to xy10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy11.
function xy11_Callback(hObject, eventdata, handles)
% hObject    handle to xy11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy12.
function xy12_Callback(hObject, eventdata, handles)
% hObject    handle to xy12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy13.
function xy13_Callback(hObject, eventdata, handles)
% hObject    handle to xy13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy14.
function xy14_Callback(hObject, eventdata, handles)
% hObject    handle to xy14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy15.
function xy15_Callback(hObject, eventdata, handles)
% hObject    handle to xy15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy16.
function xy16_Callback(hObject, eventdata, handles)
% hObject    handle to xy16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy17.
function xy17_Callback(hObject, eventdata, handles)
% hObject    handle to xy17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy18.
function xy18_Callback(hObject, eventdata, handles)
% hObject    handle to xy18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy19.
function xy19_Callback(hObject, eventdata, handles)
% hObject    handle to xy19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy20.
function xy20_Callback(hObject, eventdata, handles)
% hObject    handle to xy20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy21.
function xy21_Callback(hObject, eventdata, handles)
% hObject    handle to xy21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy22.
function xy22_Callback(hObject, eventdata, handles)
% hObject    handle to xy22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy23.
function xy23_Callback(hObject, eventdata, handles)
% hObject    handle to xy23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy24.
function xy24_Callback(hObject, eventdata, handles)
% hObject    handle to xy24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy25.
function xy25_Callback(hObject, eventdata, handles)
% hObject    handle to xy25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy26.
function xy26_Callback(hObject, eventdata, handles)
% hObject    handle to xy26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy27.
function xy27_Callback(hObject, eventdata, handles)
% hObject    handle to xy27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy28.
function xy28_Callback(hObject, eventdata, handles)
% hObject    handle to xy28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy29.
function xy29_Callback(hObject, eventdata, handles)
% hObject    handle to xy29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy30.
function xy30_Callback(hObject, eventdata, handles)
% hObject    handle to xy30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy31.
function xy31_Callback(hObject, eventdata, handles)
% hObject    handle to xy31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy32.
function xy32_Callback(hObject, eventdata, handles)
% hObject    handle to xy32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy33.
function xy33_Callback(hObject, eventdata, handles)
% hObject    handle to xy33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy34.
function xy34_Callback(hObject, eventdata, handles)
% hObject    handle to xy34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy35.
function xy35_Callback(hObject, eventdata, handles)
% hObject    handle to xy35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy36.
function xy36_Callback(hObject, eventdata, handles)
% hObject    handle to xy36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy37.
function xy37_Callback(hObject, eventdata, handles)
% hObject    handle to xy37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy38.
function xy38_Callback(hObject, eventdata, handles)
% hObject    handle to xy38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy39.
function xy39_Callback(hObject, eventdata, handles)
% hObject    handle to xy39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy40.
function xy40_Callback(hObject, eventdata, handles)
% hObject    handle to xy40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy41.
function xy41_Callback(hObject, eventdata, handles)
% hObject    handle to xy41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy42.
function xy42_Callback(hObject, eventdata, handles)
% hObject    handle to xy42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy43.
function xy43_Callback(hObject, eventdata, handles)
% hObject    handle to xy43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy44.
function xy44_Callback(hObject, eventdata, handles)
% hObject    handle to xy44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy45.
function xy45_Callback(hObject, eventdata, handles)
% hObject    handle to xy45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy46.
function xy46_Callback(hObject, eventdata, handles)
% hObject    handle to xy46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy47.
function xy47_Callback(hObject, eventdata, handles)
% hObject    handle to xy47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy48.
function xy48_Callback(hObject, eventdata, handles)
% hObject    handle to xy48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy49.
function xy49_Callback(hObject, eventdata, handles)
% hObject    handle to xy49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy50.
function xy50_Callback(hObject, eventdata, handles)
% hObject    handle to xy50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy51.
function xy51_Callback(hObject, eventdata, handles)
% hObject    handle to xy51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy52.
function xy52_Callback(hObject, eventdata, handles)
% hObject    handle to xy52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy53.
function xy53_Callback(hObject, eventdata, handles)
% hObject    handle to xy53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy54.
function xy54_Callback(hObject, eventdata, handles)
% hObject    handle to xy54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy55.
function xy55_Callback(hObject, eventdata, handles)
% hObject    handle to xy55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy56.
function xy56_Callback(hObject, eventdata, handles)
% hObject    handle to xy56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy57.
function xy57_Callback(hObject, eventdata, handles)
% hObject    handle to xy57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy58.
function xy58_Callback(hObject, eventdata, handles)
% hObject    handle to xy58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy59.
function xy59_Callback(hObject, eventdata, handles)
% hObject    handle to xy59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy60.
function xy60_Callback(hObject, eventdata, handles)
% hObject    handle to xy60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy61.
function xy61_Callback(hObject, eventdata, handles)
% hObject    handle to xy61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy62.
function xy62_Callback(hObject, eventdata, handles)
% hObject    handle to xy62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy63.
function xy63_Callback(hObject, eventdata, handles)
% hObject    handle to xy63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy64.
function xy64_Callback(hObject, eventdata, handles)
% hObject    handle to xy64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy65.
function xy65_Callback(hObject, eventdata, handles)
% hObject    handle to xy65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy66.
function xy66_Callback(hObject, eventdata, handles)
% hObject    handle to xy66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy67.
function xy67_Callback(hObject, eventdata, handles)
% hObject    handle to xy67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy65.
function xy68_Callback(hObject, eventdata, handles)
% hObject    handle to xy65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy69.
function xy69_Callback(hObject, eventdata, handles)
% hObject    handle to xy69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy70.
function xy70_Callback(hObject, eventdata, handles)
% hObject    handle to xy70 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy71.
function xy71_Callback(hObject, eventdata, handles)
% hObject    handle to xy71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy72.
function xy72_Callback(hObject, eventdata, handles)
% hObject    handle to xy72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy73.
function xy73_Callback(hObject, eventdata, handles)
% hObject    handle to xy73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy74.
function xy74_Callback(hObject, eventdata, handles)
% hObject    handle to xy74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy75.
function xy75_Callback(hObject, eventdata, handles)
% hObject    handle to xy75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy76.
function xy76_Callback(hObject, eventdata, handles)
% hObject    handle to xy76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy77.
function xy77_Callback(hObject, eventdata, handles)
% hObject    handle to xy77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy78.
function xy78_Callback(hObject, eventdata, handles)
% hObject    handle to xy78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy79.
function xy79_Callback(hObject, eventdata, handles)
% hObject    handle to xy79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy80.
function xy80_Callback(hObject, eventdata, handles)
% hObject    handle to xy80 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy81.
function xy81_Callback(hObject, eventdata, handles)
% hObject    handle to xy81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy82.
function xy82_Callback(hObject, eventdata, handles)
% hObject    handle to xy82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy83.
function xy83_Callback(hObject, eventdata, handles)
% hObject    handle to xy83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy84.
function xy84_Callback(hObject, eventdata, handles)
% hObject    handle to xy84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy85.
function xy85_Callback(hObject, eventdata, handles)
% hObject    handle to xy85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy86.
function xy86_Callback(hObject, eventdata, handles)
% hObject    handle to xy86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy87.
function xy87_Callback(hObject, eventdata, handles)
% hObject    handle to xy87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy88.
function xy88_Callback(hObject, eventdata, handles)
% hObject    handle to xy88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy89.
function xy89_Callback(hObject, eventdata, handles)
% hObject    handle to xy89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy90.
function xy90_Callback(hObject, eventdata, handles)
% hObject    handle to xy90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy91.
function xy91_Callback(hObject, eventdata, handles)
% hObject    handle to xy91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy92.
function xy92_Callback(hObject, eventdata, handles)
% hObject    handle to xy92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy93.
function xy93_Callback(hObject, eventdata, handles)
% hObject    handle to xy93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy94.
function xy94_Callback(hObject, eventdata, handles)
% hObject    handle to xy94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy95.
function xy95_Callback(hObject, eventdata, handles)
% hObject    handle to xy95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy96.
function xy96_Callback(hObject, eventdata, handles)
% hObject    handle to xy96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy97.
function xy97_Callback(hObject, eventdata, handles)
% hObject    handle to xy97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy98.
function xy98_Callback(hObject, eventdata, handles)
% hObject    handle to xy98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);

% --- Executes on button press in xy99.
function xy99_Callback(hObject, eventdata, handles)
% hObject    handle to xy99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cheak(hObject, eventdata, handles);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy0.
function xy0_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy1.
function xy1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy2.
function xy2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy3.
function xy3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy4.
function xy4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy5.
function xy5_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy6.
function xy6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy7.
function xy7_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy8.
function xy8_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy9.
function xy9_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy10.
function xy10_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy11.
function xy11_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy12.
function xy12_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy13.
function xy13_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy14.
function xy14_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy15.
function xy15_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy16.
function xy16_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy17.
function xy17_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy18.
function xy18_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy19.
function xy19_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy20.
function xy20_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy21.
function xy21_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy22.
function xy22_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy23.
function xy23_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy24.
function xy24_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy25.
function xy25_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy26.
function xy26_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy27.
function xy27_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy28.
function xy28_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy29.
function xy29_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy30.
function xy30_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy31.
function xy31_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy32.
function xy32_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy33.
function xy33_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy34.
function xy34_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy35.
function xy35_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy36.
function xy36_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy37.
function xy37_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy38.
function xy38_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy39.
function xy39_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy40.
function xy40_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy41.
function xy41_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy42.
function xy42_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy43.
function xy43_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy44.
function xy44_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy45.
function xy45_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy46.
function xy46_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy47.
function xy47_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy48.
function xy48_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy49.
function xy49_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy50.
function xy50_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy51.
function xy51_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy52.
function xy52_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy53.
function xy53_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy54.
function xy54_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy55.
function xy55_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy56.
function xy56_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy57.
function xy57_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy58.
function xy58_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy59.
function xy59_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy60.
function xy60_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy61.
function xy61_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy62.
function xy62_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy63.
function xy63_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy64.
function xy64_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy65.
function xy65_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy66.
function xy66_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy67.
function xy67_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy68.
function xy68_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy69.
function xy69_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy70.
function xy70_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy70 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy71.
function xy71_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy72.
function xy72_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy73.
function xy73_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy74.
function xy74_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy75.
function xy75_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy76.
function xy76_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy77.
function xy77_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy78.
function xy78_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy79.
function xy79_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy80.
function xy80_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy80 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy81.
function xy81_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy82.
function xy82_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy83.
function xy83_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy84.
function xy84_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy85.
function xy85_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy86.
function xy86_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy87.
function xy87_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy88.
function xy88_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy89.
function xy89_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy90.
function xy90_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy91.
function xy91_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy92.
function xy92_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy93.
function xy93_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy94.
function xy94_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy95.
function xy95_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy96.
function xy96_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy97.
function xy97_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy98.
function xy98_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over xy99.
function xy99_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to xy99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mark(hObject, eventdata, handles);


% --- Executes on button press in newgame.
function newgame_Callback(hObject, eventdata, handles)
% hObject    handle to newgame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global StartFlag TimeCount FinishFlag BoomNum;
for i=0:99  %初始化棋盘
    eval(['set(handles.xy',num2str(i), ',''string'','' '');']);
end
BoomNum=str2double(get(handles.edit1,'string'));
BoomMapInit(BoomNum);
StartFlag=1;%开始游戏标志为1
TimeCount=0;%计数器初始化为0
tic;
FinishFlag=0;%完成游戏后为1

function Timer1(hObject, eventdata, handles)
global TimeCount StartFlag;
set(handles.Nowtime,'string',['当前时间：',datestr(now)]);
if StartFlag==1
    TimeCount=TimeCount+1;
    set(handles.timetext,'string',['用时：',num2str(TimeCount),'s']);
else
    set(handles.timetext,'string',['上次用时：',num2str(TimeCount),'s']);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
