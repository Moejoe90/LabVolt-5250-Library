function cor = Get_Cart_Robot(obj)

%Get Articulate degrees from Robot and return a Cartesean represenation of the degrees 

B = Get_Degree_Robot(obj); %Get articulate degrees from the robot

deg1 = B(6); %Base Degree
deg2 = B(5); %Shoulder Degree
deg3 = B(4); %Hand Degree
deg4 = B(3); %Wrist Degree

Z = 384 + 360.4*sind(deg2) + 228.5*sind(deg3) + 165.4*sind(deg4); %Z coordinate

R = 360.4*cosd(deg2) + 228.5*cosd(deg3) + 165.4*cosd(deg4)+3; %R coodinate

x = R*cosd(deg1); %Get X Coordinate 
y = R*sind(deg1); %Get Y Coordinate

cor = [x y Z]; %Put Cartisean coordinates in an Array 

end
