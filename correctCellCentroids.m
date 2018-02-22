function [manualCentroids] = correctCellCentroids(grayImage, cellCentroids)
fig = figure('Name', 'Manual Corrections to Cells');
imshow(imadjust(grayImage));
hold on;
scatter(cellCentroids(:, 1), cellCentroids(:, 2), 10, 'filled', 'red');
[xCentroid, yCentroid] = getpts(fig);
manualCentroids = vertcat(cellCentroids, [xCentroid, yCentroid]);
end

