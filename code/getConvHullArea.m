function [ area, perimeter ] = getConvHullArea( img )
%GETCONVHULLAREA Returns the area and the perimeter of the convex hull of matrix img

%img = imread('../Acer palmaturu BW/iPAD2_C11_EX06_B.TIFF', 'tiff');

contour = bwmorph(img, 'remove');

[w, h] = size(img);

contourX = [];
contourY = [];

for i = 1:w
    for j = 1:h
        if(contour(i,j) > 0)
            contourX = [contourX i];
            contourY = [contourY j];
        end
    end
end

%plot(contourY, contourX, '.');
k = convhull(contourX, contourY);
%hold on, plot(contourY(k), contourX(k), '-r'), hold off

perimeter = 0;
for i = 1:length(k)-1
    perimeter = perimeter + dist(k(i), k(i+1));
end
perimeter = perimeter + dist(k(1), k(length(k))); % last line


area = polyarea(contourY(k), contourX(k));

end

