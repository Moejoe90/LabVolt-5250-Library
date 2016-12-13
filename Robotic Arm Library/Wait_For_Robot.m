function position = Wait_For_Robot(obj)

i=1;

ref = 'test';

test = '1';

remain =1;

x = 0;

fprintf(obj,'get pos');

pause(0.25);

while i < 720



while(obj.BytesAvailable == 0)

end





test = fscanf(obj,'%c',obj.BytesAvailable);

fprintf(obj,'get pos');

pause(0.25);

if(strcmp(ref,test))

remain = remain+1;

end

ref = test;

if(remain > 1)

test = '>END';

end



if(strfind(test,'>ERR') ~= 0)

position = 'ERROR'

return;

end



if(strfind(test,'>ESTOP') ~= 0)

position = 'RELEASE ROBTIC ARM EMERGENCY STOP'

return;

end



if(strfind(test,'>LIMIT') ~= 0)

position = 'LIMIT REACHED'

return;

end



if(strfind(test,'>GRIP_OBJECT') ~= 0)

position = 'OBJECT GRABBED'

pause(1);

Stop_Robot(obj);

pause(1);

return;

end



if(strfind(test,'>END') ~= 0)

position = Get_Degree_Robot(obj);

break

end

85





i = i+1;

end



if i == 720;

position = 'ROBOTIC ARM TIME OUT'

return;

end

end
