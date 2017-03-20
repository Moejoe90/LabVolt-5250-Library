function position = Calibrate_Robot( obj ) 

%Initiate the Calibration position for the Robot by testing the limits
%of each Servo Motor  

if(Check_Robot_State(obj) == 0) %If robot is not connected return 
return;
end

fprintf(obj,'hardhome'); %Initiale the Calibration movement 

while 1 %Start loop for Robot feedback

while(obj.BytesAvailable == 0)  %Wait until there is a responce from the robot by checking the Input Buffer
end


test = fscanf(obj,'%c',obj.BytesAvailable); %Read Robots responce

if(strfind(test,'>ERR') ~= 0) %Check if robot replies with an error
position = 'ERROR' %Print out error
return; %Exit

end



if(strfind(test,'>ESTOP') ~= 0) %Check if robot returns an emergancy button pressed message
position = 'RELEASE ROBTIC ARM EMERGENCY STOP' %Print out Error
return; %Exit
end

if(strfind(test,'>END') ~= 0) %Check if Robot finished Calibration successfully 
position = Get_Degree_Robot(obj); %Return Final position
break; %leave loop
end 
end
end
