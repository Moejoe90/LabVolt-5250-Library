function Real = Cam_to_World(obj,MyFis3,poly,grip,rot,x,y,z)

Get_Degree_Robot(obj);

Real(1) = (x^2*poly(1,1)) + (x * poly(1,2)) + poly(1,3);

Real(2) = (y^2*poly(2,1)) + (y * poly(2,2)) + poly(2,3);

Go_Cart_Robot(obj,MyFis3,grip,rot,Real(1),Real(2),z,-90);

68

end

function x = Check_Robot_State(obj)

x = 1;

fprintf(obj,'remote');

while(obj.BytesAvailable == 0)

pause(0.25);

end

test = fscanf(obj,'%c',obj.BytesAvailable);

if(strfind(test,'>ERR') ~= 0)

position = 'ERROR'

x = 0;

return;

end



if(strfind(test,'>ESTOP') ~= 0)

position = 'RELEASE ROBTIC ARM EMERGENCY STOP'

x = 0;

return;

end

end
