
SE_small_disk = strel('disk',10);
SE_med_disk = strel('disk',15);
SE_lg_disk = strel('disk',25);

img = pennies;

img_open_sm = imopen(img,SE_small_disk);
img_open_med = imopen(img,SE_med_disk);
img_open_lg = imopen(img,SE_lg_disk);

figure;
subplot(2,2,1);imshow(img);title('Original');
subplot(2,2,2);imshow(img_open_sm);title('Open sm 10');
subplot(2,2,3);imshow(img_open_med);title('Open med 15');
subplot(2,2,4);imshow(img_open_lg);title('Open lg 25');