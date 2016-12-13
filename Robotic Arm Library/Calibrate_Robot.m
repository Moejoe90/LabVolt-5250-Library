function position = Calibrate_Robot( obj )

if(Check_Robot_State(obj) == 0)

return;

end

fprintf(obj,'hardhome');

while 1



while(obj.BytesAvailable == 0)

end



test = fscanf(obj,'%c',obj.BytesAvailable);



if(strfind(test,'>ERR') ~= 0)

position = 'ERROR'

return;

end



if(strfind(test,'>ESTOP') ~= 0)

position = 'RELEASE ROBTIC ARM EMERGENCY STOP'

return;

end



if(strfind(test,'>END') ~= 0)

position = Get_Degree_Robot(obj);

break;

end





end



end
