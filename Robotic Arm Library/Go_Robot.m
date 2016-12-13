function position = Go_Robot(obj,grip,wrist_rot,wrist,arm,shoulder,base)

if(Check_Robot_State(obj)== 0)

return;

end

x(1) = grip*20000;

x(2) = wrist_rot*525;

x(3) = int32(wrist/0.001699*-1);

x(4) = int32(arm*666.66667*-1);

x(5) = int32((shoulder - 105)/0.0015);

x(6) = int32(base*666.667);

formatSpec = 'run 50 0 %d %d %d %d %d %5d 0 1';

string = sprintf(formatSpec,x(1),x(2),x(3),x(4),x(5),x(6));

flushinput(obj);

fprintf(obj,string);

end
