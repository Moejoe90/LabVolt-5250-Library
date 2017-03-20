function Real = Cam_to_World(obj,MyFis3,poly,grip,rot,x,y,z)

%Return the real world coordinates that the Arm should take from camera coordinates
%This function should be used after calibrating both polynomials using Calib_Cordinates function
%And uploading the Generated Fuzzy Logic file to conduct Carteasan movement

Get_Degree_Robot(obj); %Get the location of Robot in Degrees

Real(1) = (x^2*poly(1,1)) + (x * poly(1,2)) + poly(1,3); %Get world X coordinates by fitting the poly quations
Real(2) = (y^2*poly(2,1)) + (y * poly(2,2)) + poly(2,3); %Get world Y coordinates by fitting the poly quations

Go_Cart_Robot(obj,MyFis3,grip,rot,Real(1),Real(2),z,-90); %Move Robotic Arm to the given Coordinates
end


