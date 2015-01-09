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


% Recuperer image
%
imgPath = input('Path to TIFF image to compare: ','s');
if isempty(imgPath)
    disp('No image specified. Aborting');
    return;
end



%% SVM
% [w, b] = SVMlearn(X, Y);
% vect = TIMVecteur(img)';
% result = SVM( vect, w, b )
% disp(sprintf('Une feuille de %s', labelToName(result)));




%% KPPV

% test
% for i = [1 28]
%     YPeval = kppv(X(i, :), X(2:27, :), Y(2:27), 5, []);
%     disp(YPeval);
% end


img = imread(imgPath, 'tiff');

disp('Processing image...');
vect = TIMVecteur(img)';

disp('Resolving class...');
YPeval = kppv(vect, X, Y, 5, []);
disp(sprintf('Une feuille de %s', labelToName(YPeval)));
