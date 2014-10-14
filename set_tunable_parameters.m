function set_tunable_parameters(imH,imW)
global g_th_image
global g_str_ele
global g_filter2d
global g_thresh_val
global g_y_wt

% set the tunable parameters (refer README file for description of parameters)
%*****************************
sigma=2;
radius_str_ele=10;
absolute_diff_threshold=40;
steps=10;
step_wt=2;

%*****************************

%compute the following parameters required only once when the program is
%started. Store them as global variable and access in the program when
%required. 
% do NOT change any of the parameters below
g_filter2d=fspecial('gaussian',6*sigma+1,sigma);
g_str_ele=strel('disk',radius_str_ele);
g_thresh_val=absolute_diff_threshold;
g_th_image=zeros(imH,imW);

g_y_wt=ones(imH,floor(imW/2));
wt=1;

for i=1:steps:size(g_y_wt,2)
   
    wt=wt*step_wt;
    inc_step=0;
    
    while(i+inc_step<=size(g_y_wt,2) && inc_step<steps)
     g_y_wt(:,i+inc_step)=wt;
     inc_step=inc_step+1;
    end
    
end

if (mod(imW,2)~=0)
    g_y_wt=cat(2,fliplr(g_y_wt)*-1,ones(imH,1),g_y_wt);
else
    g_y_wt=cat(2,fliplr(g_y_wt)*-1,g_y_wt);
end

% As we are using the webcam, our right motion appears as left motion in
% the video captured by the webcam. Hence, reverse the left and right
% halfves of the weight matrix g_y_wt
g_y_wt=fliplr(g_y_wt);