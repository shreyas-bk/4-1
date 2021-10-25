%Read picture into Matlab as a matrix
imdata = imread('Shreyas_Mobile_Photo.png');
%Convert color image to gray shades image
gray = rgb2gray(imdata);
%Display gray image
figure(1)
imshow(gray)
title ('gray image');
%Save gray image
imwrite(gray,'gray.png')
%Increase brightness
inc_brightness = gray + 50;
%Decrease brightness
dec_brightness = gray - 50;
%Increase contrast
inc_contrast = imadjust(gray,[0.3,0.7],[]);
%Decrease contrast
dec_contrast = imadjust(gray,[],[0.3,0.7]);
%Show Results
figure
subplot (2,2,1);
imshow(inc_brightness)
title ('Increase brightness');
subplot (2,2,2);
imshow(dec_brightness)
title ('Decrease brightness');
subplot (2,2,3);
imshow(inc_contrast)
title ('Increase contrast');
subplot (2,2,4);
imshow(dec_contrast)
title ('Decrease contrast');

