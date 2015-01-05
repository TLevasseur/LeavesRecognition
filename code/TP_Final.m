clear all; close all;

if exist('data.mat', 'file') == 2
    load('data.mat');
else
    disp('data.mat not found: generating data...');
    createData();
    disp('Done');
end

Y = data(:, 1);
X = data(:, 2:size(data, 2));


X0=X(find(Y==1),:);
X1=X(find(Y==2),:);

App0=X0(1:size(X0,1)/3,:);
Val0=X0(size(X0,1)/3+1:2*size(X0,1)/3,:);
Test0=X0(2*size(X0,1)/3+1:size(X0,1),:);

App1=X1(1:size(X1,1)/3,:);
Val1=X1(size(X1,1)/3+1:2*size(X1,1)/3,:);
Test1=X1(2*size(X1,1)/3+1:size(X1,1),:);


AppX=[App0; App1];%taille 533
AppY=[-ones(size(App0,1),1);ones(size(App1,1),1)];
ValX=[Val0; Val1];%taille 533
ValY=[-ones(size(Val0,1),1);ones(size(Val1,1),1)];
TestX=[Test0; Test1];%taille 533
TestY=[-ones(size(Test0,1),1);ones(size(Test1,1),1)];

[n,p]=size(AppX);
C=1000;

cvx_begin quiet 
    cvx_precision best
    variables w(p) b AppXi(n)
    minimize(0.5*w'*w+C*sum(AppXi))
    subject to
        AppY.*(AppX*w+b)>=1-AppXi
        AppXi>0
cvx_end

ResultatValidation=sign(ValX*w+b);
Valide=size(find(ResultatValidation==ValY),1);
erreurVal=(abs(Valide-size(X,1)/3))/(size(X,1)/3);


ResultatTest=sign(TestX*w+b);
Valide=size(find(ResultatTest==TestY),1);
erreurTest=(abs(Valide-size(X,1)/3))/(size(X,1)/3);
