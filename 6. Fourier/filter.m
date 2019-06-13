clc;
clear;
%% 1. Input image.
img=imread('Unknown.jpg');
subplot(1,6,1);
imshow(img);
title('original image');
%% 2. Pre-process image.
img=rgb2gray(img);
img=double(img);
[M N]=size(img);
cut_off_freq=10;
for i=1:M
    for j=1:N
        f1(i,j)=img(i,j)*((-1)^(i+j));
    end
end
%imshow(f1);
%% 3. Fourier transform image. DFT
dff=fft2(f1);
%imshow(dff);
subplot(1,6,2);
imshow(dff);
title('fft2');
%% Create filter.
for i=1:M
    for j=1:N
        if sqrt((((M/2)-i)^2)+(((N/2)-j)^2)) < cut_off_freq
            h(i,j)=0;
        else
            h(i,j)=1;
        end
    end
end
%% Filter image.
f2=dff.*h;
subplot(1,6,3);
imshow(f2);
title('high pass filtered f image');
%imshow(h);
%% 6. Inverse fourier transform image.
f2=ifft2(f2);
for i=1:M
    for j=1:N
        f3(i,j)=f2(i,j)*((-1)^(i+j));
    end
end
f=uint8(f3);
subplot(1,6,4);
imshow(f);
title('high passed image');
%% Create filter.
for i=1:M
    for j=1:N
        if sqrt((((M/2)-i)^2)+(((N/2)-j)^2)) > cut_off_freq
            h(i,j)=0;
        else
            h(i,j)=1;
        end
    end
end
%% Filter image.
f2=dff.*h;
subplot(1,6,5);
imshow(f2);
title('low passed f image');
%% 6. Inverse fourier transform image.
f2=ifft2(f2);
for i=1:M
    for j=1:N
        f3(i,j)=f2(i,j)*((-1)^(i+j));
    end
end
f=uint8(f3);
subplot(1,6,6);
imshow(f);
title('low passed image');