function [filoCentroids] = findFilo(grayImage, mask)
noCells = grayImage - mask;

filoCentroids = vertcat(stats.Centroid);

end