Please unzip the folder named Intel_assigment.zip
The following m files are present in the folder:

1. main.m: Run this file to start the GUI

2. Approach_used_currently.m :
This file uses the current method for detect motion.

3. Approach_1_in_alternative_algorithm_approaches.m: 
This file uses the method described in #1 in the “Alternative algorithm approaches” section. 
To try out this algorithm in main.m one can change the  UpdatePreviewWindowFcn to 
“Approach_1_in_alternative_algorithm_approaches”. The update preview function is set 
using the following command:
setappdata(hImage,'UpdatePreviewWindowFcn',@name_of_function);
Please replace “@name_of_function” by “@Approach_1_in_alternative_algorithm_approaches”


4. Approach_2_in_alternative_algorithm_approaches.m
This file uses the method described in #2 in the “Alternative algorithm approaches” section. 
To try out this algorithm in main.m one can change the  UpdatePreviewWindowFcn to 
“Approach_2_in_alternative_algorithm_approaches”. The update preview function is set using 
the following command:
setappdata(hImage,'UpdatePreviewWindowFcn',@name_of_function);
Please replace “@name_of_function” by “@Approach_2_in_alternative_algorithm_approaches”

5. get_parameters.m: loads parameters and weight matrix y_wt while computing the weights A1, A2 or A3.

6. set_tunable_parameters.m: Change the tunable parameters by resetting their values in the 
function set_tunable_parameters.m before running the main.m program. This function is called 
in main.m to precompute the weight matrix Y_WT. The parameter n_disp_frames is not present in 
set_tunable_parameters.m. To change n_disp_frames, please find the parameter in the following 
functions depending on the motion detection approach you would like to use: 
Approach_used_currently.m
Approach_1_in_alternative_algorithm_approaches.m
Approach_2_in_alternative_algorithm_approaches.m

7. Find_a.m: computes the weight (A1, A2 or A3) for a pair of adjacent frames.



**********************************************************************************

Start the GUI by running the program main.m

GUI buttons:

Pause: Pause the GUI
Restart: used to start the GUI after it has been paused.
Close: Quit the GUI


**********************************************************************************