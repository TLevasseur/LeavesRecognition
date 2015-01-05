
%img = imread('iPAD2_C11_EX06_B.TIFF', 'tiff');


%% ERABLE
files = dir('../Acer palmaturu BW/*.TIFF');

thisData = zeros(length(files), 10 + 1); % 10 is TIMVector length, + 1 for label

i = 1;
for file = files'
    img = imread(strcat('../Acer palmaturu BW/', file.name), 'tiff');
    
    vect = [1 TIMVecteur(img)'];
    thisData(i, :) = vect;
    
    i = i + 1;
    % Do some stuff
end

data = thisData;


%% ORTIE
files = dir('../Urtica dioica BW/*.TIFF');

thisData = zeros(length(files), 10 + 1); % 10 is TIMVector length, + 1 for label

i = 1;
for file = files'
    img = imread(strcat('../Urtica dioica BW/', file.name), 'tiff');
    
    vect = [2 TIMVecteur(img)'];
    thisData(i, :) = vect;
    
    i = i + 1;
    % Do some stuff
end

data = [data ; thisData];

save('data.mat', 'data');