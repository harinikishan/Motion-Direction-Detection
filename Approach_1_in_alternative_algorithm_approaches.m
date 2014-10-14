function Approach_1_in_alternative_algorithm_approaches(obj,event,himage)
 
 img1 = getsnapshot(obj);
 set(himage, 'CData', img1, 'EraseMode', 'none')
 img1=rgb2gray(img1);
 uicontrol('Style','text','Position',[400 10 120 20],'String',' ');
 prev_im=img1;
 dir_ind=0;
 
 % the delay parameter to prevent false positives when motion has already
 % been detected. Denotes the number of frames which have to be played back
 % to the GUI without processing them
 n_disp_frames=12;
 
if(dir_ind==0)
    a1=0;a2=0;a3=0;
    p_1=getsnapshot(obj);
    set(himage, 'CData', p_1, 'EraseMode', 'none')
    p_1=rgb2gray(p_1);
    
    % Pause for sometime and later obtain the next frame.
    % The pause is not needed for frames other than the first frame as
    % the value of weight "a" is being computed for the other frames.
    pause(0.12);
    
    p_2=getsnapshot(obj); 
    set(himage, 'CData', p_2, 'EraseMode', 'none')
    p_2=rgb2gray(p_2);
    %     tic
    % compute weight a1 for frames p_1 and p_2
    a1=Find_a(p_1,p_2);
    %     toc
    
    p_3=getsnapshot(obj);
    set(himage, 'CData', p_3, 'EraseMode', 'none')
    p_3=rgb2gray(p_3);
    %     tic
    % compute weight a2 for frames p_2 and p_3
    a2=Find_a(p_2,p_3);
    %     toc
    
    p_4=getsnapshot(obj);
    set(himage, 'CData', p_4, 'EraseMode', 'none')
    p_4=rgb2gray(p_4);
    
    % compute weight a3 for frames p_3 and p_4
    a3=Find_a(p_3,p_4);
    
    prev_im=p_4;
end


while(dir_ind==0)

    img1 = getsnapshot(obj);
    set(himage, 'CData', img1, 'EraseMode', 'none')
    img1=rgb2gray(img1);
    %Reassign a1 and a2
    a1=a2;
    a2=a3;
    
    % compute weight a3 for previous frame and current frame
    a3=Find_a(prev_im,img1);
    prev_im=img1;
%     disp(strcat('First a1=',num2str(a1),', a2=',num2str(a2),', a3=',num2str(a3)))
    
    dir_ind=0;
  
    %check for motion detected and display on GUI
    if(a1>=0 && a2>=0 && a3>0 && a1<a2 && a2<a3)
        dir_ind=1; 
        disp('motion detected: right')
        uicontrol('Style','text','Position',[400 10 120 20],'String','RIGHT');
          
        %play back the acquired frames and do not process them. This
        %prevents false positive when motion has already been detected
        for i=1:n_disp_frames
                im_temp = getsnapshot(obj);
                set(himage, 'CData', im_temp, 'EraseMode', 'none')  
        end
        uicontrol('Style','text','Position',[400 10 120 20],'String',' ');
        continue
    end
    
    if (a1<=0 && a2<0 && a3<0 && a1>a2 && a2>a3)
        dir_ind=-1;
        disp('motion detected: left')
        uicontrol('Style','text','Position',[400 10 120 20],'String','LEFT');
        
        %play back the acquired frames and do not process them. This
        %prevents false positive when motion has already been detected
        for i=1:n_disp_frames
                im_temp = getsnapshot(obj);
                set(himage, 'CData', im_temp, 'EraseMode', 'none')  
        end
        uicontrol('Style','text','Position',[400 10 120 20],'String',' ');
        continue;
        
    end
    
end