function [ vect ] = TIMVecteur( img )
n=4;
[long, larg]=TIMRectangle(img);
[ ri , rc, centre] = TIMCercle( img );
[aire, perim] =getConvHullArea( img );

vect=zeros(n,1);
vect(1)=long/larg;
vect(2)=aire/(long*larg);
vect(3)=(long+larg)/perim;
vect(4)=ri/rc;

end

