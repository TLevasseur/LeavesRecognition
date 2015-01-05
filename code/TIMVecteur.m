function [ vect ] = TIMVecteur( img )
n=6;
[long, larg]=TIMRectangle(img);
[ ri , rc, centre] = TIMCercle( img );
[aire, perim] =getConvHullArea( img );

vect=zeros(n,1);
vect(1)=long/larg;%Aspect ratio
vect(2)=aire/(long*larg);%Ration d'aire
vect(3)=(long+larg)/perim;%Ratio de perimetre
vect(4)=ri/rc;%'Sphéricité'


contour = bwmorph(img,'remove');
Mur=0;
compteur=0;
for i=1:size(contour,1)
    for j=1:size(contour,2)
        if (contour(i,j)==1)
            Mur=Mur+norm(contour(i,j)-centre);
            compteur=compteur+1;
        end
    end
end
Mur=Mur/compteur;
sigr=0;
for i=1:size(contour,1)
    for j=1:size(contour,2)
        if (contour(i,j)==1)
            sigr=sigr+norm(contour(i,j)-centre)-Mur;
        end
    end
end
sigr=sigr/compteur;

vect(5)=Mur/sigr;%Circularité

vect(6)=4*PI*long*larg/(long+larg)^2;



end

