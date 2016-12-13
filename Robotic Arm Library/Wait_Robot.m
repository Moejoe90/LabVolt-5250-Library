function x = Wait_Robot( obj )

fprintf(obj,'hardhome');

i=1;

%pause(10);

if any(obj.BytesAvailable ~= 0)

while 1



if any(obj.BytesAvailable ~= 0)

test = fscanf(obj,'%c',obj.BytesAvailable);



if(strcmp(test(1,1:4),'>END'))

x = Grade(obj);

break

end

else

pause(3)

end



end

else

x=0;

end

end
