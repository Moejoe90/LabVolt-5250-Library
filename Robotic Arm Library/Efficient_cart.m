function data = Efficient_cart()

%%

deg1 = 45;

deg4 = -210;

stop = 0;

stop_min = 0;

start =1;

star_min=1;

deg2 = -25;

while(deg2 <= 90)

deg3 = deg2-115;

while(deg3 <= deg2+115)

deg4(1:141,1) = ((deg3-70):(deg3+70));

the3(1:71,1) = deg3;

the2(1:71,1) = deg2;

x(1:71,1) =

cosd(deg1)*((230*cosd(deg2+deg3))+(380*cosd(deg2))+(150*sind(deg2+deg3+deg4

(1:2:141))));

69

y(1:71,1) =

sind(deg1)*((230*cosd(deg2+deg3))+(380*cosd(deg2))+(150*sind(deg2+deg3+deg4

(1:2:141))));

z(1:71,1) = 380 + (380*sind(deg2))+ (230*sind(deg2+deg3))-

(150*cosd(deg2+deg3+deg4(1:2:141)));

R = sqrt( x(1:71).^2 + y(1:71).^2);

stop = stop +35;

stop_min = stop_min +35;

data(star_min:stop_min,1:5) = [R(1:2:70) z(1:2:70) the2(1:2:70)

the3(1:2:70) deg4(1:4:140)];

star_min=stop_min+1;

deg3 = deg3+5.5;

end

deg2 = deg2+5.5;

end

data2=data(1:3:end,1:5);

[plot(data2(:,1), data2(:,2), 'r.');

plot(data(:,1), data(:,2), 'r.');

m = matfile('C:\Users\Public\hello3.mat','Writable',true);

m.data(start:10290,1:5) = data2(:,1:5);

start = stop+1;

star_min =1;

stop_min =0;

clear data deg4 the3 the2 the1 x y z;

end
