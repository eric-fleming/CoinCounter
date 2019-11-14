function [bin_p,bin_np] = final_coin_seg_rgb(img,yourP,fileName)
%

% for printing
path = 'coins/segments/';

% split into channels
rgb = img;
r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);

% to help fix boundary
SE_disk = strel('disk',20);
% removes segements below this pixel threshold in bw_area_open 
P = yourP;

%penny binary image gray=75
gray = 50;
binaryImage_p = (r > gray) & (g > gray) & (b > gray) & (r >= 2*b) & (r <= 5*b) & (r < 2*g);
binaryImage_p = imfill(binaryImage_p, 'holes');
binaryImage_p = imclose(binaryImage_p,SE_disk);
binaryImage_p = bwareaopen(binaryImage_p,P);
file_p = append(path,fileName,'_bin_p_rgb.jpg');
imwrite(binaryImage_p,file_p);


%nickel, dime, and quarter binary image
gray = 100;
binaryImage_ndq = (r > gray) & (g > gray) & (b > gray) & (r < g + 50);
binaryImage_ndq = imfill(binaryImage_ndq, 'holes');
binaryImage_ndq = imclose(binaryImage_ndq,SE_disk);
binaryImage_ndq = bwareaopen(binaryImage_ndq,P);
file_np = append(path,fileName,'_bin_np_rgb.jpg');
imwrite(binaryImage_ndq,file_np);

% prints out comparison
figure;
subplot(1,3,1);imshow(img);title('original');
subplot(1,3,2);imshow(binaryImage_p);title('bin-p');
subplot(1,3,3);imshow(binaryImage_ndq);title('bin-np');

bin_p = binaryImage_p;
bin_np = binaryImage_ndq;
end

