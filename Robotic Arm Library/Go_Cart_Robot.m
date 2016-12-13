function Go_Cart_Robot(obj,anfis1,grip,rot,x,y,Z,DEG)

71

flushinput(obj);

r = sqrt(x^2+y^2);

ShoulderLlimit = -29;

ShoulderHlimit = 120;

Arm_Llimit = 120;

Arm_Hlimit = 118;

Wrist_Hlimit = 78;

Wrist_Llimit = 78;

ok = 0;

the = radtodeg(atan2(y,abs(x)));

i=3;

%if(the >= 90 || the <= -90)



% r=r*-1;

% i=0;

%end

if(abs(r) < 150 && Z < 450)

return;

end



deg4 = evalfis([r Z],anfis1);

deg4b = deg4;

i = 1;

if(DEG == 666)



grade = Get_Degree_Robot(obj);

deg4 = grade(3);

else

deg4 = DEG;

end

Re = r - 165.4*cosd(deg4)-3;

Ze = Z - 384 - 165.4*sind(deg4);



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

else

while deg4 < 250 || deg4b > -250



if(i > 1)

deg4 = deg4+1;

deg4b = deg4b-1;

end



if(deg4 <= 250)







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



if Deg2s1b <= Deg1s1b+Arm_Hlimit && Deg2s1b >= Deg1s1b-Arm_Llimit &&

Deg1s1b > ShoulderLlimit && Deg1s1b < ShoulderHlimit && deg4b <=

Deg2s1b+Wrist_Hlimit && deg4b >= Deg2s1b-Wrist_Llimit

z = real(384 + 360.4*sind(Deg1s1b) + 228.5*sind(Deg2s1b) +

165.4*sind(deg4b));

74

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

if(ok == 0)

return;

end

75

x2 = r*cosd(the);

y2 = r*sind(the);

deg1 = the;

x(1) = grip*20000;

x(2) = rot*525;

x(3) = int32(deg4/0.001699*-1);

x(4) = int32(deg3*666.66667*-1);

x(5) = int32((deg2 - 105)/0.0015);

x(6) = int32(the*666.667);

formatSpec = 'run 50 0 %d %d %d %d %d %5d 0 1';

string = sprintf(formatSpec,x(1),x(2),x(3),x(4),x(5),x(6));

fprintf(obj,string);



i = 0;

pause(0.5);

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



76



i = i+1;

end

if i == 20000;

position = 'ROBOTIC ARM TIME OUT'

end

end
