function [bin_p,bin_np] = final_coin_seg_hsv(img,yourP,fileName)
%This function takes an img and segments it into two separate binary
%images.  One representing the pennies and the other representing the other
%coins.

% for printing
path = 'coins/segments/';

%convert to hsv, img assumed to be rgb
hsv = rgb2hsv(img);
h = hsv(:,:,1);
s = hsv(:,:,2);
v = hsv(:,:,3);

% to help fix boundary
SE_disk = strel('disk',20);
% removes segements below this pixel threshold in bw_area_open 
P = yourP;

% configured to original photo shoot brightness

%penny hsv
binaryImage_p = (h >= 0.03 & h <= 0.08) & (s > 0.35 & s < 1.00) & (v < 1.00 & v > 0.33);
binaryImage_p = imfill(binaryImage_p, 'holes');
binaryImage_p = imclose(binaryImage_p,SE_disk);
binaryImage_p = bwareaopen(binaryImage_p,P);
file_p = append(path,fileName,'_bin_p_hsv.jpg');
imwrite(binaryImage_p,file_p);

%nickel, dime, and quarter hsv
binaryImage_ndq = (h > 0.03 & h <= 0.15) & (s > 0.10 & s < 0.35) & (v < 1.00 & v > 0.48);
binaryImage_ndq = imfill(binaryImage_ndq, 'holes');
binaryImage_ndq = imclose(binaryImage_ndq,SE_disk);
binaryImage_ndq = bwareaopen(binaryImage_ndq,P);
file_np = append(path,fileName,'_bin_np_hsv.jpg');
imwrite(binaryImage_ndq,file_np);

% prints out comparison
figure;
subplot(1,3,1);imshow(img);title('original');
subplot(1,3,2);imshow(binaryImage_p);title('bin-p');
subplot(1,3,3);imshow(binaryImage_ndq);title('bin-np');

bin_p = binaryImage_p;
bin_np = binaryImage_ndq;
end

