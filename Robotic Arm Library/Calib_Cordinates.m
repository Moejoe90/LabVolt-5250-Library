function poly_cor = Calib_Cordinates(points,Org,Stuff)

%Calibrate Real world coordinates with Camera Cooridnates by fitting a polynomial function for two Matrices 
%that represent X, Y coordinates that represent location pointers for Real world and Camera.In this 

centre = Locate_obj(Org,Stuff,4); %Automacally Detect and return a Matrix with X,Y Camera coordiantes 

if(size(centre) ~= size(points)) %Check if the automatically detected refrence points on the Camera Matrix are
%the same with the World coordinate Matrix

string = 'COORDINATES NOT THE SAME SIZE'; %Return Error message.
end

test(1:5,1) = centre(1:5,1) %Arrange the matrix to condesent before fitting
[test,b] = sort(test(1:5,1),'descend'); %Arrange the Matrix
centre(1:5,1) = centre(b(1:5),1); %Arrange opperations
centre(1:5,2) = centre(b(1:5),2); %Arrange operations
polyx = polyfit(centre(1:end,1),points(1:end,1),2); %Start Polynimial fitting processes for X coordinates
polyy = polyfit(centre(1:end,2),points(1:end,2),2); %Start Polynimial fitting processes for Y coordinates
poly_cor(1,1:3)= polyx; % Put the X coordinate Generated polynomial equation
poly_cor(2,1:3)= polyy; % Put the Y coordinate polynomial equation

end
