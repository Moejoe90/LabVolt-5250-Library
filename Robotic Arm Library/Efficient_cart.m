function data = Efficient_cart()

% A function that generates forrward kenimatic equations in relevance with X,Y,Z coordinates and write 
%Everything to a .mat file

deg1 = 45; %Base Degree
deg4 = -210; %Wrist Degree
stop = 0;
stop_min = 0;
start =1;
star_min=1;
deg2 = -25; %Shoulder

while(deg2 <= 90) %shoulder Degree

deg3 = deg2-115; %Lower limit

while(deg3 <= deg2+115) %Make sure to not pass the upper limit

deg4(1:141,1) = ((deg3-70):(deg3+70)); %Make sure wrist doesn't pass lower limit or upper limit

the3(1:71,1) = deg3; %Put same degree in a 71 element array for coordination

the2(1:71,1) = deg2; %Put Same degree in a 71 element array for coordination

%apply Forward kenimatics equations for the 5250 Robot these equation are derived analytacily 

x(1:71,1) = cosd(deg1)*((230*cosd(deg2+deg3))+(380*cosd(deg2))+(150*sind(deg2+deg3+deg4(1:2:141))));
y(1:71,1) = sind(deg1)*((230*cosd(deg2+deg3))+(380*cosd(deg2))+(150*sind(deg2+deg3+deg4(1:2:141))));
z(1:71,1) = 380 + (380*sind(deg2))+ (230*sind(deg2+deg3))- (150*cosd(deg2+deg3+deg4(1:2:141)));


R = sqrt( x(1:71).^2 + y(1:71).^2); %Create Polar coordinate from cartisean 

stop = stop +35; %refrence for main matrix that will hold all coordinates

stop_min = stop_min +35; %Refrence for main matrix the will hold all coordinates

%prepare how data should be put on the output file 
data(star_min:stop_min,1:5) = [R(1:2:70) z(1:2:70) the2(1:2:70) the3(1:2:70) deg4(1:4:140)];

star_min=stop_min+1; %Matrix refrence 
deg3 = deg3+5.5; %Increment the Hand
end
deg2 = deg2+5.5;  %Increment the shoulder
end

data2=data(1:3:end,1:5); %Take half the data

[plot(data2(:,1), data2(:,2), 'r.'); %Plot half the Data 

plot(data(:,1), data(:,2), 'r.'); %Plot the full data

m = matfile('C:\Users\Public\hello3.mat','Writable',true); %Prepare a .Mat file for writing

m.data(start:10290,1:5) = data2(:,1:5); %write the full data

start = stop+1; %start from the beggining 

star_min =1;

stop_min =0;

clear data deg4 the3 the2 the1 x y z; %Clear the data to start again and save memory 

end
