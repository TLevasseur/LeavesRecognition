function [ area ] = getConvHullArea( img )
%GETCONVHULLAREA Returns the area within the convex hull of matrix img

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

area = polyarea(contourY(k), contourX(k))

end

