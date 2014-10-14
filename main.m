clc
clear all
close all

% Create a video input object.
vid = videoinput('winvideo');

% Create a figure window. 
hFig = figure('Toolbar','none',...
       'Menubar', 'none',...
       'NumberTitle','Off',...
       'Name','Direction indicator');

% Set up the ui push buttons
uicontrol('String', 'Restart',...
    'Callback', 'preview(vid)',...
    'Units','normalized',...
    'Position',[0 0 0.15 .07]);
uicontrol('String', 'Pause',...
    'Callback', 'stoppreview(vid)',...
    'Units','normalized',...
    'Position',[.17 0 .15 .07]);
uicontrol('String', 'Close',...
    'Callback', 'close(gcf)',...
    'Units','normalized',...
    'Position',[0.34 0 .15 .07]);

% set up ui static text to display direction 
uicontrol('Style','text',...
        'Position',[400 10 120 20],...
        'String','direction indicator');
 
% Create the image object to display the video preview data.
vidRes = vid.VideoResolution;
imWidth = vidRes(1);
imHeight = vidRes(2);
nBands = vid.NumberOfBands;
hImage = image( zeros(imHeight, imWidth, nBands) );

% Specify the size of the axes that contains the image object
figSize = get(hFig,'Position');
figWidth = figSize(3);
figHeight = figSize(4);

% Precompute the weight matrix y_wt and use it when required in the program
set_tunable_parameters(imHeight,imWidth);

% Set up the update preview window function.
% setappdata(hImage,'UpdatePreviewWindowFcn',@Approach_used_currently);
% setappdata(hImage,'UpdatePreviewWindowFcn',@Approach_1_in_alternative_algorithm_approaches);
setappdata(hImage,'UpdatePreviewWindowFcn',@Approach_2_in_alternative_algorithm_approaches);
%  Display the video data in GUI.
preview(vid, hImage);