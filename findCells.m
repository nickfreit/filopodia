function [cellCentroids, cellMask] = findCells(grayImage)
filteredGray = medfilt2(grayImage, [10 10]); % better relative
cellMask = imbinarize(filteredGray);
cellMask = bwpropfilt(cellMask, 'area', [500 262144]); % better relative

stats = regionprops(cellMask, 'centroid', 'area');
cellCentroids = vertcat(stats.Centroid);
areas = vertcat(stats.Area);
cellCentroids = cellCentroids(areas > 500, :); % make this relative

end

