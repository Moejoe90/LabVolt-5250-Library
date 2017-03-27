function position = Wait_For_Robot(obj)
%Stall Matlab from conducting other commands, while robot is moving
%Except for the case where a stop commaand is sent 
%The function compares two position calls with a time between them
%If the two positions read are the same the arm finished movement


i=1;

ref = 'test';

test = '1';

remain =1;

x = 0;
%Get position of Robot
fprintf(obj,'get pos');

%Wait for the Controller to replay 
pause(0.25);

while i < 720
%Wait for buffer to get data from Controller
while(obj.BytesAvailable == 0)
end


%Read data from controller
test = fscanf(obj,'%c',obj.BytesAvailable);

%Get the position again 
fprintf(obj,'get pos');
pause(0.25);

%Compare two strings together if they are the same increment flag
if(strcmp(ref,test))
remain = remain+1;
end

ref = test;
%Check if flag is raised
if(remain > 1)
test = '>END';
end

%Check if error flag is raised 
if(strfind(test,'>ERR') ~= 0)
position = 'ERROR'
return;
end

%Check if emergency button is pressed
if(strfind(test,'>ESTOP') ~= 0)
position = 'RELEASE ROBTIC ARM EMERGENCY STOP'
return;
end

%Check if arm reached its physical limit
if(strfind(test,'>LIMIT') ~= 0)
position = 'LIMIT REACHED'
return;
end

%Check if gripper raised a flag
%THIS IS A BIT BUGGY MORE WORK SHOULD BE DONE WITH THE GRIPPER FLAG
if(strfind(test,'>GRIP_OBJECT') ~= 0)
position = 'OBJECT GRABBED'
pause(1);
Stop_Robot(obj);
pause(1);
return;
end

%If end flag get final position and return succssess
if(strfind(test,'>END') ~= 0)
position = Get_Degree_Robot(obj);
break
end

i = i+1;
end

%Check for time out
if i == 720;
position = 'ROBOTIC ARM TIME OUT'
return;
end

end
