function cor = Get_Cart_Robot(obj)

%x2 =

cosd(DEG1)*((230*cosd(DEG2+DEG3))+(380*cosd(DEG2))+(150*sind(DEG2+DEG3+DEG4

)));

%y2 =

sind(DEG1)*((230*cosd(DEG2+DEG3))+(380*cosd(DEG2))+(150*sind(DEG2+DEG3+DEG4

)));

70

%z2 = 380 + (380*sind(DEG2))+ (230*sind(DEG2+DEG3))-

(150*cosd(DEG2+DEG3+DEG4));

B = Get_Degree_Robot(obj);

deg1 = B(6);

deg2 = B(5);

deg3 = B(4);

deg4 = B(3);

Z = 384 + 360.4*sind(deg2) + 228.5*sind(deg3) + 165.4*sind(deg4);

R = 360.4*cosd(deg2) + 228.5*cosd(deg3) + 165.4*cosd(deg4)+3;

x = R*cosd(deg1);

y = R*sind(deg1);

cor = [x y Z];

end
