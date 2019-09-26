clc; clear all; close all;
f=imread('cameraman.tif');
f=double(f);
h=gaussFilter(5,1);              

figure(1);
imshow(uint8(f));
title('Original image');

%Blurring the image using DCT2 and IDCT2
k=dct2(f);
for i=1:256
    for j=1:256
    if (i>60 && j>60)
        k(i,j)=0;
    end
    end
end

blur=idct2(k);
figure;
imshow(uint8(blur));
title('Blurred Image');

%Deblurring the image
alpha=3; 
beta=2;

final=(alpha.*blur)-(beta.*(filter2(h,blur)));

figure;
imshow(uint8(final));
title('Deblurred image with \alpha = 3 & \beta = 2');