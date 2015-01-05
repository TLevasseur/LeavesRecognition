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
X1=X(find(Y==-1),:);

App0=X0(1:size(X0,1)-2,:);
Test0=X0(size(X0,1)-1:size(X0,1),:);

App1=X1(1:size(X1,1)-1,:);
Test1=X1(size(X1,1):size(X1,1),:);


AppX=[App0; App1];
AppY=[ones(size(App0,1),1);-ones(size(App1,1),1)];

TestX=[Test0; Test1];
TestY=[ones(size(Test0,1),1);-ones(size(Test1,1),1)];

[n,p]=size(AppX);
C=10;

cvx_begin quiet 
    cvx_precision best
    variables w(p) b AppXi(n)
    minimize(0.5*w'*w+C*sum(AppXi))
    subject to
        AppY.*(AppX*w+b)>=1-AppXi
        AppXi>0
cvx_end

ResultatTest=sign(TestX*w+b);
Valide=size(find(ResultatTest==TestY),1);
erreurTest=(abs(Valide-size(TestX,1)))/(size(TestX,1));
