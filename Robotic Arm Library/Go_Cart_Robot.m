function Go_Cart_Robot(obj,anfis1,grip,rot,x,y,Z,DEG)

%Use inverse kenimatics techniques to let Robot go to a specific position

flushinput(obj); %Flush the input buffer and make it zero 

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

if(DEG == 666) %If input equals 666 then let the rotation degree stay as it was 



grade = Get_Degree_Robot(obj); %Get the Wrist rotation degree

deg4 = grade(3); %Put wrist to test the degree

else

deg4 = DEG; %Let deg4 be the prediction 

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

deg1 = the; %Get the Base degree


%Conduct Degree to articulate transformations 

x(1) = grip*20000; 

x(2) = rot*525;

x(3) = int32(deg4/0.001699*-1);

x(4) = int32(deg3*666.66667*-1);

x(5) = int32((deg2 - 105)/0.0015);

x(6) = int32(the*666.667);


formatSpec = 'run 50 0 %d %d %d %d %d %5d 0 1'; %Prepare the order string

string = sprintf(formatSpec,x(1),x(2),x(3),x(4),x(5),x(6));

fprintf(obj,string); %Release the hounds 

i = 0; 

pause(0.5); %Wait

remain = 1;

ref = [0 0 0 0 0 0];

test = '1';

while i < 20000



while(obj.BytesAvailable == 0)

end

test = fscanf(obj,'%c',obj.BytesAvailable);

fprintf(obj,'get pos');

pause(0.25);

if(strcmp(ref,test))

remain = remain+1;

end

ref = test;

if(remain > 1)

test = '>END';

end

if(strfind(test,'ERR') ~= 0)

position = 'ERROR'

return;

end

if(strfind(test,'ESTOP') ~= 0)

position = 'RELEASE ROBTIC ARM EMERGENCY STOP'

return;

end

if(strfind(test,'LIMIT') ~= 0)

position = 'LIMIT REACHED'

return;

end

if(strfind(test,'END') ~= 0)

% position = Get_Degree_Robot(obj)

break

end

i = i+1;

end

if i == 20000;

position = 'ROBOTIC ARM TIME OUT'

end

end
