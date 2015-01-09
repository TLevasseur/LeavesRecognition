function [ result, erreur ] = SVM( X, w, b, Y )
% Donne dans ypred la classe de chaque X
% Si les labels Y sont passés en paramètre, donne également l'erreur

result = sign(X * w + b);

if nargin == 4
    erreur = mean(result ~= Y);
end

end

