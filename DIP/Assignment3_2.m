ti(101:150,51:200)=0;
ti(51:200,101:150)=0;
ti=mat2gray(ti,[0,255]);
%image dimensions -> 250x250
dim = 250;
%initialize 2D zero array
image = zeros(dim, dim);
%set to white
image(:) = 255;
%create black cross using two rectangles
image(101:150, 51:200) = 0;
image(51:200, 101:150) = 0;
%create grayscale image from matrix
image = mat2gray(image, [0,255]);
%fft of image
dft_image = fft2(image);
%dft transform
dfshift_image = fftshift(dft_image);
%dct of image
dct_image = dct2(image);
%wavelet transform of image
[average, horizontal, vertical, diagonal] = dwt2(image, 'db2');
%radius of removal
radius=sqrt((dim*dim)/2)/pi;
for i = 1:dim
    for j = 1:dim
        if( (i-dim/2)^2 + (j-dim/2)^2 >= radius*radius)
            dfshift_image(i, j) = 0;
        end
    end
end
%reconstruct
dft_shift_reconstruct = ifftshift(dfshift_image);
dft_reconstruct=ifft2(dft_shift_reconstruct);
%remove right corner
for i = 1:dim
    for j = dim-i+1:dim
        dct_image(i, j) = 0;
    end
end
%reconstruct
dct_reconstruct = idct2(dct_image);
%replace average, diagonal of DWT with zero
dwt_reconstruct_ad = idwt2(zeros(126, 126), horizontal, vertical, zeros(126, 126), 'db2');
%replace horizontal, vertical of DWT with zero
dwt_reconstruct_hv = idwt2(average, zeros(126, 126), zeros(126, 126), diagonal, 'db2');

figure
imshow(image)
title ("Image");

figure
imshow(abs(dft_reconstruct))
title ("50% high coefficients removed from DFT");

figure
imshow(dct_reconstruct)
title ("50% right corner removed from DCT");

figure
imshow(dwt_reconstruct_ad)
title ("Average and diagonal components removed from DWT");

figure
imshow(dwt_reconstruct_hv)
title("Horizontal and vertical components removed from DWT");