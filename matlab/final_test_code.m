% Testing the separation into binary images
% pennies and not-pennies

fileName = 'change2';
testimg = change2;

% Two methods seg_hsv and seg_rgb
% Addjust the last param to get rid of poor segments
[p,np] = final_coin_seg_hsv(testimg,10000,fileName);

% Testing the get_circles function
% Passes
dataPath = 'coins/data/';
dataFile_p = append(dataPath,'radii_p_',fileName,'.csv');
dataFile_np = append(dataPath,'radii_np_',fileName,'.csv');


% 'coins/data/radii_p_manycoins_refl.csv'
% 'coins/data/radii_np_manycoins_refl.csv'
[num_of_p,centers_p,radii_p] = final_get_circles(p,5,50,500,0.92,dataFile_p);
[num_of_notp,centers_notp,radii_notp] = final_get_circles(np,5,50,500,0.92,dataFile_np);