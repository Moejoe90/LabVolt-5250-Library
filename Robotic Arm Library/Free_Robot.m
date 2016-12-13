function Free_Robot(obj)

if(Check_Robot_State(obj) == 0)

return;

end

fprintf(obj,'free');

while(obj.BytesAvailable == 0)

end

result = fscanf(obj,'%c',obj.BytesAvailable)

end
