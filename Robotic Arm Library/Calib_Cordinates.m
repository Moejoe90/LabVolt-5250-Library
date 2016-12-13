function poly_cor = Calib_Cordinates(points,Org,Stuff)

centre = Locate_obj(Org,Stuff,4);

if(size(centre) ~= size(points))

string = 'COORDINATES NOT THE SAME SIZE';

Figure 3.1 RS232 PINS

67

end

test(1:5,1) = centre(1:5,1)

[test,b] = sort(test(1:5,1),'descend');

centre(1:5,1) = centre(b(1:5),1);

centre(1:5,2) = centre(b(1:5),2);

polyx = polyfit(centre(1:end,1),points(1:end,1),2);

polyy = polyfit(centre(1:end,2),points(1:end,2),2);

poly_cor(1,1:3)= polyx;

poly_cor(2,1:3)= polyy;

end
