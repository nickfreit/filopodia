% Choose directory and read .tiff or .tif files from it
dirName = uigetdir();
folderInfo = dir(fullfile(dirName, '*.tif*'));
numImages = size(folderInfo, 1);

% Create structure that will store information about images
imgs(numImages).pixels = {};
imgs(numImages).path = {};
imgs(numImages).cells = {};
for i = 1:numImages
    imgs(i).path = strcat(folderInfo(i).folder, '\', folderInfo(i).name); % Only for windows, fix
    imgs(i).pixels = getImageData(imgs(i).path);
end

for i = 1:numImages
    imgs(i).cells = findCells(imgs(i).pixels(:,:,1));
end

for i = 1:numImages
    figure;
    imshow(imgs(i).pixels(:,:,1));
    hold on;
    centroids = vertcat(imgs(i).cells.centroid);
    scatter(centroids(:,1), centroids(:,2), 8);
end