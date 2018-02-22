function  pixels = getImageData(fullPath)

numSlices = size(imfinfo(fullPath), 1);
firstImage = imread(fullPath, 1);
horizSize = size(firstImage, 1);
vertSize = size(firstImage, 2);

pixels = zeros(horizSize, vertSize, numSlices); 
pixels(:,:,1) = mat2gray(firstImage);

for i = 2:numSlices
    pixels(:,:,i) = mat2gray(imread(fullPath, i));
end

    