function [ longueur, largeur ] = TIMRectangle( img )
xmax=0;
xmin=size(img,1);
ymax=0;
ymin=size(img,2);
for i=1:size(img,1)
    for j=1:size(img,2)
        if (img(i,j)==1)
            if(i<xmin)
                xmin=i;
            end
            if(i>xmax)
                xmax=i;
            end
            if(j<ymin)
                ymin=j;
            end
            if(j>ymax)
                ymax=j;
            end            
        end
    end
end

longueur=xmax-xmin;
largeur=ymax-ymin;

if(longueur<largeur)
   tmp=longueur;
   longueur=largeur;
   largeur=tmp;    
end

end

