function [filo] = findFilo(grayImage)
grayImage = medfilt2(grayImage);
bwImage = imbinarize(grayImage);
imshow(bwImage);
stats = regionprops(bwImage, 'centroid', 'area');

centroids = vertcat(stats.Centroid);
areas = vertcat(stats.Area);
indices = areas < mean(areas);
centroids = centroids(indices, :);
areas = areas(indices);

filo.centroids = centroids;
filo.areas = areas;

%  figure;
%  imshow(grayImage);
%  hold on;
%  scatter(centroids(:,1), centroids(:,2), 8);
end