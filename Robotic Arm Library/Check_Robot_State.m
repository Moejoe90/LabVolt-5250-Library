function x = Check_Robot_State(obj)

%Inquire about the current states of the Robot and wait for an answer

x = 1;

fprintf(obj,'remote'); %Send states check order to Robot

while(obj.BytesAvailable == 0) %Wait until Input buffer gets data

pause(0.25); %Give Robot Arm time to processes

end

test = fscanf(obj,'%c',obj.BytesAvailable); %Read the states of the Robot

if(strfind(test,'>ERR') ~= 0) %Check if Robot returned error states
position = 'ERROR' %Print out error
x = 0; %Set error flag
return; %Get out
end



if(strfind(test,'>ESTOP') ~= 0) %Check if the Emergency button is pressed
position = 'RELEASE ROBTIC ARM EMERGENCY STOP' %Ask user to release button first
x = 0; %Set error flag
return; %get out
end %ciao 

end
