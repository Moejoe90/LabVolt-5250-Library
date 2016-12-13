function Free_Robot(obj) %Free the Robot Arm Servo Motors

if(Check_Robot_State(obj) == 0) %Check if Robot Arm is connected and initialized 
return; %Return error
end

fprintf(obj,'free'); %Free the Robot Motors
while(obj.BytesAvailable == 0) %Wait for Robot To respond
end
result = fscanf(obj,'%c',obj.BytesAvailable) % Print out Robots Response, add ; to get rid of screen reporting

end %Function End
