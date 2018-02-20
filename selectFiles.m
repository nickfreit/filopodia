[fileName, pathName, filterIndex] = ...
    uigetfile({'*.tif'; '*.tiff'}, 'Choose file(s)', 'Multiselect', 'on');


if iscell(fileName)
    for i = 1:length(fileName)
        fullPath = strcat(pathName, fileName{i});
        images = getImageData(fullPath);
    end
else
    fullPath = strcat(pathName, fileName);
    images = getImageData(fullPath);
    [bwImage, centroids] = findCellCentroids(images);
end