function [ w, b ] = SVM( X, Y )
%LDA Summary of this function goes here
%   Detailed explanation goes here


[n,p] = size(X);
C = 1000;

disp('Minimisation par CVX...');
cvx_begin quiet
    variables w(p) b AppXi(n)
    minimize(w'/2 * w + C * sum(AppXi))
    subject to
        Y.*(X * w + b) >= 1 - AppXi
        AppXi >= 0
cvx_end
disp('Minimisation terminee');

end

