%Read picture into Matlab as a matrix
imdata = imread('Shreyas_Laptop_Photo.jpg');
%Convert color image to gray shades image
gray = rgb2gray(imdata);
%Increase brightness
inc_brightness = gray + 50;
%Decrease brightness
dec_brightness = gray - 50;
%Increase contrast
inc_contrast = imadjust(gray,[0.3,0.7],[]);
%Decrease contrast
dec_contrast = imadjust(gray,[],[0.3,0.7]);

%Apply histogram equalization
inc_brightness_eq = histeq(inc_brightness);
dec_brightness_eq = histeq(dec_brightness);
inc_contrast_eq = histeq(inc_contrast);
dec_contrast_eq = histeq(dec_contrast);

figure
subplot(1,2,1)
imshow(gray)
title ('gray image');
subplot(1,2,2)
imhist(gray,64)


figure
subplot(1,2,1)
imshow(inc_brightness)
title ('inc brightness');
subplot(1,2,2)
imhist(inc_brightness,64)

figure
subplot(1,2,1)
imshow(dec_brightness)
title ('dec brightness');
subplot(1,2,2)
imhist(dec_brightness,64)

figure
subplot(1,2,1)
imshow(inc_contrast)
title ('inc contrast');
subplot(1,2,2)
imhist(inc_contrast,64)

figure
subplot(1,2,1)
imshow(dec_contrast)
title ('dec contrast');
subplot(1,2,2)
imhist(dec_contrast,64)


figure
subplot(1,2,1)
imshow(inc_brightness_eq)
title ('inc brightness_eq');
subplot(1,2,2)
imhist(inc_brightness_eq,64)

figure
subplot(1,2,1)
imshow(dec_brightness_eq)
title ('dec brightness eq');
subplot(1,2,2)
imhist(dec_brightness_eq,64)


figure
subplot(1,2,1)
imshow(inc_contrast_eq)
title ('inc contrast eq');
subplot(1,2,2)
imhist(inc_contrast_eq,64)

figure
subplot(1,2,1)
imshow(dec_contrast_eq)
title ('dec contrast eq');
subplot(1,2,2)
imhist(dec_contrast_eq,64)