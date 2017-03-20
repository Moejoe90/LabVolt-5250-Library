function x = Close_Robot( obj )

%Close Robot after finishing work

fclose(obj); %Send close order to matlab 

obj %Output the states of the port

end
