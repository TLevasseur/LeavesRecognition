
%img = imread('iPAD2_C11_EX06_B.TIFF', 'tiff');

TIMVECTEUR_SIZE = 6;


%% ERABLE
files = dir('../Acer palmaturu BW/*.TIFF');

thisData = zeros(length(files), TIMVECTEUR_SIZE + 1); % + 1 for label

i = 1;
for file = files'
    
    disp(strcat('  Processing : ', file.name));
    img = imread(strcat('../Acer palmaturu BW/', file.name), 'tiff');
    
    vect = [2 TIMVecteur(img)'];
    thisData(i, :) = vect;
    
    i = i + 1;
    % Do some stuff
end

data = thisData;


%% ORTIE
files = dir('../Urtica dioica BW/*.TIFF');

thisData = zeros(length(files), TIMVECTEUR_SIZE + 1); % + 1 for label

i = 1;
for file = files'
    
    disp(strcat('  Processing : ', file.name));
    img = imread(strcat('../Urtica dioica BW/', file.name), 'tiff');
    
    vect = [6 TIMVecteur(img)'];
    thisData(i, :) = vect;
    
    i = i + 1;
    % Do some stuff
end

data = [data ; thisData];


%% Corylus
files = dir('../13. Corylus avellana/*.TIFF');

thisData = zeros(length(files), TIMVECTEUR_SIZE + 1); % + 1 for label

i = 1;
for file = files'
    
    disp(strcat('  Processing : ', file.name));
    img = imread(strcat('../13. Corylus avellana/', file.name), 'tiff');
    
    vect = [13 TIMVecteur(img)'];
    thisData(i, :) = vect;
    
    i = i + 1;
    % Do some stuff
end

data = [data ; thisData];


%% Geranium
files = dir('../36. Geranium sp/*.TIFF');

thisData = zeros(length(files), TIMVECTEUR_SIZE + 1); % + 1 for label

i = 1;
for file = files'
    
    disp(strcat('  Processing : ', file.name));
    img = imread(strcat('../36. Geranium sp/', file.name), 'tiff');
    
    vect = [36 TIMVecteur(img)'];
    thisData(i, :) = vect;
    
    i = i + 1;
    % Do some stuff
end

data = [data ; thisData];

save('data.mat', 'data');