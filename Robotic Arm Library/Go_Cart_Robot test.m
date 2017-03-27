function (x2,y2,z) = Go_Cart_Robot(anfis1,grip,rot,x,y,Z,DEG)

%Use inverse kenimatics techniques to let Robot go to a specific position


r = sqrt(x^2+y^2); %Get the R from X,Y to simplfy the degree of freedom

ShoulderLlimit = -29; %Set lower limit 

ShoulderHlimit = 120; %Set upper limit 

Arm_Llimit = 120; %Set Lower limit

Arm_Hlimit = 118; %Set upper limit

Wrist_Hlimit = 78; %Wrist set upper limit

Wrist_Llimit = 78; %Wrist Set lower limit

ok = 0; %Flag

the = radtodeg(atan2(y,abs(x))); %Get degree

i=3;

%if(the >= 90 || the <= -90)



% r=r*-1;

% i=0;

%end

if(abs(r) < 150 && Z < 450) %Make sure that the needed coordinates are withing the physical boundries
return;
end



deg4 = evalfis([r Z],anfis1); %User fuzzy logic to predict a degree that works 

deg4b = deg4;

i = 1;



deg4 = grade(3); %Put wrist to test the degree

else

deg4 = 0; %Let deg4 be the prediction 

end

Re = r - 165.4*cosd(deg4)-3; %Get an R axis based on prediction

Ze = Z - 384 - 165.4*sind(deg4); %Get a Z axis based on prediction

%The equations below are generated using MATLAB to solve a nonlinear equation 
%These equations generate four answers two of them are discraded from the beggining



Deg1s1 = -2*atan(((Re^2*(456*Ze + (-(Re^2 + Ze^2 - 17424)*(Re^2 +

Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 - 77616) - (77616*(456*Ze +

(-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re +

Ze^2 - 77616) - 1176*Ze + (Ze^2*(456*Ze + (-(Re^2 + Ze^2 - 17424)*(Re^2 +

Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 - 77616) + (456*Re*(456*Ze +

(-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re +

Ze^2 - 77616))/(Re^2 + 720*Re + Ze^2 + 77616));

Deg1s1 = real(radtodeg(Deg1s1));



Deg2s1 = 2*atan((456*Ze + (-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 -

345744))^(1/2))/(Re^2 + 456*Re + Ze^2 - 77616));

Deg2s1 = real(radtodeg(Deg2s1));

72



Deg1s2 = -2*atan(((456*Re*(456*Ze - (-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2

- 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 - 77616) - (77616*(456*Ze - (-

(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2

- 77616) - 1176*Ze + (Re^2*(456*Ze - (-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 -

345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 - 77616) + (Ze^2*(456*Ze - (-(Re^2 +

Ze^2 - 17424)*(Re^2 + Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 -

77616))/(Re^2 + 720*Re + Ze^2 + 77616));

Deg1s2 = real(radtodeg(Deg1s2));



Deg2s2 = 2*atan((456*Ze - (-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 -

345744))^(1/2))/(Re^2 + 456*Re + Ze^2 - 77616));

Deg2s2 = real(radtodeg(Deg2s2));

%The Condition statements below check if the Generated degrees are withing the physical limit

if Deg2s1 <= Deg1s1+Arm_Hlimit && Deg2s1 >= Deg1s1-Arm_Llimit && Deg1s1 >

ShoulderLlimit && Deg1s1 < ShoulderHlimit && deg4 <= Deg2s1+Wrist_Hlimit &&

deg4 >= Deg2s1-Wrist_Llimit

z = real(384 + 360.4*sind(Deg1s1) + 228.5*sind(Deg2s1) + 165.4*sind(deg4));

r = real(360.4*cosd(Deg1s1) + 228.5*cosd(Deg2s1) + 165.4*cosd(deg4))+3;

deg3 = Deg2s1;

deg2 = Deg1s1;

ok = 1;

else



if Deg2s2 <= Deg1s2+Arm_Hlimit && Deg2s2 >= Deg1s2-Arm_Llimit && Deg1s2 >

ShoulderLlimit && Deg1s2 < ShoulderHlimit && deg4 <= Deg2s2+Wrist_Hlimit &&

deg4 >= Deg2s2-Wrist_Llimit

z = real(384 + 360.4*sind(Deg1s2) + 228.5*sind(Deg2s2) + 165.4*sind(deg4));

r = real(360.4*cosd(Deg1s2) + 228.5*cosd(Deg2s2) + 165.4*cosd(deg4))+3;

deg3 = Deg2s2;

deg2 = Deg1s2;

ok = 1;

%if the first Prediction didn't abid to the arms physical limits a search in both directions is conducted
%to find an answer that will world

else

while deg4 < 250 || deg4b > -250 %Set the limit for Wrist 



if(i > 1) %If the loop was conducted more than once start the increment processes

deg4 = deg4+1;

deg4b = deg4b-1;

end

if(deg4 <= 250) 

%The set of following equations will solve the problem using the incremented Wrist degree
%In this case it will go in both directions 


Re = r - 165.4*cosd(deg4)-3;

Ze = Z - 384 - 165.4*sind(deg4);



Deg1s1 = -2*atan(((Re^2*(456*Ze + (-(Re^2 + Ze^2 - 17424)*(Re^2 +

Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 - 77616) - (77616*(456*Ze +

(-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re +

Ze^2 - 77616) - 1176*Ze + (Ze^2*(456*Ze + (-(Re^2 + Ze^2 - 17424)*(Re^2 +

Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 - 77616) + (456*Re*(456*Ze +

(-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re +

Ze^2 - 77616))/(Re^2 + 720*Re + Ze^2 + 77616));

73

Deg1s1 = real(radtodeg(Deg1s1));



Deg2s1 = 2*atan((456*Ze + (-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 -

345744))^(1/2))/(Re^2 + 456*Re + Ze^2 - 77616));

Deg2s1 = real(radtodeg(Deg2s1));



Deg1s2 = -2*atan(((456*Re*(456*Ze - (-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2

- 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 - 77616) - (77616*(456*Ze - (-

(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2

- 77616) - 1176*Ze + (Re^2*(456*Ze - (-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 -

345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 - 77616) + (Ze^2*(456*Ze - (-(Re^2 +

Ze^2 - 17424)*(Re^2 + Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 -

77616))/(Re^2 + 720*Re + Ze^2 + 77616));

Deg1s2 = real(radtodeg(Deg1s2));



Deg2s2 = 2*atan((456*Ze - (-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 -

345744))^(1/2))/(Re^2 + 456*Re + Ze^2 - 77616));

Deg2s2 = real(radtodeg(Deg2s2));

end



if(deg4b >= -250)

Re = r - 165.4*cosd(deg4b)-3;

Ze = Z - 384 - 165.4*sind(deg4b);



Deg1s1b = -2*atan(((Re^2*(456*Ze + (-(Re^2 + Ze^2 - 17424)*(Re^2 +

Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 - 77616) - (77616*(456*Ze +

(-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re +

Ze^2 - 77616) - 1176*Ze + (Ze^2*(456*Ze + (-(Re^2 + Ze^2 - 17424)*(Re^2 +

Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 - 77616) + (456*Re*(456*Ze +

(-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re +

Ze^2 - 77616))/(Re^2 + 720*Re + Ze^2 + 77616));

Deg1s1b = real(radtodeg(Deg1s1b));

Deg2s1b = 2*atan((456*Ze + (-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 -

345744))^(1/2))/(Re^2 + 456*Re + Ze^2 - 77616));

Deg2s1b = real(radtodeg(Deg2s1b));

Deg1s2b = -2*atan(((456*Re*(456*Ze - (-(Re^2 + Ze^2 - 17424)*(Re^2 +

Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 - 77616) - (77616*(456*Ze -

(-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re +

Ze^2 - 77616) - 1176*Ze + (Re^2*(456*Ze - (-(Re^2 + Ze^2 - 17424)*(Re^2 +

Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2 - 77616) + (Ze^2*(456*Ze - (-

(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 - 345744))^(1/2)))/(Re^2 + 456*Re + Ze^2

- 77616))/(Re^2 + 720*Re + Ze^2 + 77616));

Deg1s2b = real(radtodeg(Deg1s2b));

Deg2s2b = 2*atan((456*Ze - (-(Re^2 + Ze^2 - 17424)*(Re^2 + Ze^2 -

345744))^(1/2))/(Re^2 + 456*Re + Ze^2 - 77616));

Deg2s2b = real(radtodeg(Deg2s2b));

end

%The follwing conditions will check if the degree are abbiding to the physical limits of the robot arm 
%If they abit the found degrees will be recorded and used if not something might happen.

if Deg2s1b <= Deg1s1b+Arm_Hlimit && Deg2s1b >= Deg1s1b-Arm_Llimit &&
Deg1s1b > ShoulderLlimit && Deg1s1b < ShoulderHlimit && deg4b <=
Deg2s1b+Wrist_Hlimit && deg4b >= Deg2s1b-Wrist_Llimit

z = real(384 + 360.4*sind(Deg1s1b) + 228.5*sind(Deg2s1b) +
165.4*sind(deg4b));

r = real(360.4*cosd(Deg1s1b) + 228.5*cosd(Deg2s1b) + 165.4*cosd(deg4b))+3;

deg4 = deg4b;

deg3 = Deg2s1b;

deg2 = Deg1s1b;

ok = 1;

break;

else



if Deg2s2b <= Deg1s2b+Arm_Hlimit && Deg2s2b >= Deg1s2b-Arm_Llimit &&

Deg1s2b > ShoulderLlimit && Deg1s2b < ShoulderHlimit && deg4b <=

Deg2s2b+Wrist_Hlimit && deg4b >= Deg2s2b-Wrist_Llimit

z = real(384 + 360.4*sind(Deg1s2b) + 228.5*sind(Deg2s2b) +

165.4*sind(deg4b));

r = real(360.4*cosd(Deg1s2b) + 228.5*cosd(Deg2s2b) + 165.4*cosd(deg4b))+3;

deg4 = deg4b;

deg3 = Deg2s2b;

deg2 = Deg1s2b;

ok = 1;

break;



else

if Deg2s1 <= Deg1s1+Arm_Hlimit && Deg2s1 >= Deg1s1-Arm_Llimit && Deg1s1 >

ShoulderLlimit && Deg1s1 < ShoulderHlimit && deg4 <= Deg2s1+Wrist_Hlimit &&

deg4 >= Deg2s1-Wrist_Llimit

z = real(384 + 360.4*sind(Deg1s1) + 228.5*sind(Deg2s1) + 165.4*sind(deg4));

r = real(360.4*cosd(Deg1s1) + 228.5*cosd(Deg2s1) + 165.4*cosd(deg4))+3;

deg3 = Deg2s1;

deg2 = Deg1s1;

ok = 1;

break;

else



if Deg2s2 <= Deg1s2+Arm_Hlimit && Deg2s2 >= Deg1s2-Arm_Llimit && Deg1s2 >

ShoulderLlimit && Deg1s2 < ShoulderHlimit && deg4 <= Deg2s2+Wrist_Hlimit &&

deg4 >= Deg2s2-Wrist_Llimit

z = real(384 + 360.4*sind(Deg1s2) + 228.5*sind(Deg2s2) + 165.4*sind(deg4));

r = real(360.4*cosd(Deg1s2) + 228.5*cosd(Deg2s2) + 165.4*cosd(deg4))+3;

deg3 = Deg2s2;

deg2 = Deg1s2;

ok = 1;

break;

else

i = i + 1;

end

end

end

end

end

end

end


if(ok == 0) %Check if a applicable degree was found or not
return;

end

%Conduct forrward mechanics on the arm to check if the degrees are correct or not and compare

x2 = r*cosd(the); 

y2 = r*sind(the); 

return (x2,y2,z)


end
