function [flag_a]=Find_a(image1,image2)   

% load all the parameters required
[th_image,str_ele,filter2d,thresh_val,y_wt]=get_parameters();

% compute absolute frame difference
imd=abs(double(image1)-double(image2));

%filter frame difference with 2d Gaussian kernel
imd=imfilter(imd,filter2d);

%Perform morphological opening
imd=imopen(imd, str_ele);

%Perform morphological closing
imd=imclose(imd,str_ele);

% Threshold the processed frame difference
th_image(imd>thresh_val)=1;
no_of_pix=sum(th_image(:));

flag_a=0;
%compute weight a for the frame difference
if no_of_pix~=0
    flag_a=sum(y_wt(th_image==1))/no_of_pix;
end

end