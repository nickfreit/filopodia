% Using bigger median filter helps

function [cells] = findCells(grayImage)
filteredGray = medfilt2(grayImage);
bwImage = imbinarize(filteredGray);

stats = regionprops(bwImage, 'centroid', 'area');
centroids = vertcat(stats.Centroid);
areas = vertcat(stats.Area);
centroids = centroids(areas > mean(areas), :);
numCells = size(centroids, 1);
cells(numCells).area = 0;
cells(numCells).centroid = 0;

for i = 1:numCells
    cells(i).area = areas(i);
    cells(i).centroid = centroids(i, :);
end
end

