function position = Go_Robot(obj,grip,wrist_rot,wrist,arm,shoulder,base)
%Send Robot to a specific point based on the articulate Coordinates
%Given in the function


if(Check_Robot_State(obj)== 0) %Check if the robot arm is connected
return; %End program
end


%These calculations change the input Regular degree, to Robot joint Coordinates

x(1) = grip*20000; 

x(2) = wrist_rot*525;

x(3) = int32(wrist/0.001699*-1);

x(4) = int32(arm*666.66667*-1);

x(5) = int32((shoulder - 105)/0.0015);

x(6) = int32(base*666.667);

%Prepare the Coordinate packet to be sent to the Robot Controller
formatSpec = 'run 50 0 %d %d %d %d %d %5d 0 1';
string = sprintf(formatSpec,x(1),x(2),x(3),x(4),x(5),x(6));

%Flush input buffer incase garbage is present
flushinput(obj);

%Send Data packet
fprintf(obj,string);

end
