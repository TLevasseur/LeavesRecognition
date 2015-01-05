function [ ri , rc ] = TIMCercle( img )

conteur=0;
sommej=0;
sommei=0;
for i=1:size(img,1)
    for j=1:size(img,2)
        if (img(i,j)==1)
          conteur=conteur+1;
          sommej=sommej+j;
          sommei=sommei+i;
        end
    end
end
centrex=round(sommej/conteur);
centrey=round(sommei/conteur);
centre=[centrex; centrey];

distI=size(img);
distC=0;
for i=1:size(img,1)
    for j=1:size(img,2)
        tmp=norm([j;i]-centre);
        if (img(i,j)==0)
            if(tmp<distI)
                distI=tmp;
            end
        end
        if (img(i,j)==1)
            if(tmp>distC)
                distC=tmp;
            end
        end
    end
end

ri=distI;
rc=distC;

end

