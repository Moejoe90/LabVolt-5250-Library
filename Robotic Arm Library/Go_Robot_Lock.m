x(1) = grip*20000;

x(2) = wrist_rot*525;

x(3) = int32(wrist/0.001699*-1);

x(4) = int32(arm*666.66667*-1);

x(5) = int32((shoulder - 105)/0.0015);

x(6) = int32(base*666.667);

formatSpec = 'run 50 0 %d %d %d %d %d %5d 0 1';

string = sprintf(formatSpec,x(1),x(2),x(3),x(4),x(5),x(6));

flushoutput(obj);

pause(0.5);

fprintf(obj,string);

i = 0;

ref = 'test';

test = '1';

remain =1;

while i < 20000



while(obj.BytesAvailable == 0)

end

test = fscanf(obj,'%c',obj.BytesAvailable);

fprintf(obj,'get pos');

pause(0.25);

if(strcmp(ref,test))

remain = remain+1;

77

end

ref = test;

if(remain > 1)

test = '>END';

end



if(strfind(test,'>ERR') ~= 0)

position = 'ERROR'

feedback = 0;

return;

end



if(strfind(test,'>ESTOP') ~= 0)

position = 'RELEASE ROBTIC ARM EMERGENCY STOP'

feedback = 0;

return;

end

if(strfind(test,'>LIMIT') ~= 0)

position = 'LIMIT REACHED'

feedback = 0;

return;

end



if(strfind(test,'>END') ~= 0)

feedback = 1;

break

end





i = i+1;

end

if i == 20000;

position = 'ROBOTIC ARM TIME OUT'

end

end
