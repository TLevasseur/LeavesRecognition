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


%% KPPV
for i = [1 28]
    YPeval = kppv(X(i, :), X(2:27, :), Y(2:27), 5, []);
    disp(YPeval);
end