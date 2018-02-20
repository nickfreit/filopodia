function [imgStruct] = getImageData(fullPath)

numImgs = size(imfinfo(fullPath), 1);
firstImage = imread(fullPath, 1);
horizSize = size(firstImage, 1);
vertSize = size(firstImage, 2);
imgStruct(numImgs).imgMatrix = zeros(horizSize, vertSize);
imgStruct(1).imgMatrix = mat2gray(firstImage);

for i = 2:numImgs
    imgStruct(i).imgMarix = mat2gray(imread(fullPath, i));
end
    