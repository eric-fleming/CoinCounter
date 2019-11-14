function [num_of_coins,coin_centers,radii] = final_get_circles(img,se_size,rmin,rmax,sensitive,fileName)
% Given an image, find circles of a given radius and Hough Transform
% sensitivity.  Outputs the number of circles, coin centers, and radii.

% binary image
%gray = rgb2gray(img);
%bw = imbinarize(gray,graythresh(gray));

bw = img;

% fill in circles
bw2 = imfill(bw, 'holes');
% remove debris from the background
SE_disk = strel('disk',se_size);
bw3 = imopen(bw2,SE_disk);

[coin_centers,radii,metric] = imfindcircles(bw3,[rmin,rmax],'Method','TwoStage','Sensitivity',sensitive);
[num_of_coins,dim] = size(coin_centers);

writematrix(radii,fileName);

end

