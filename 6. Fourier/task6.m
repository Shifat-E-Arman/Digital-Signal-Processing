clear;
clc;
%% Steps of Filtering in frequency domain
% 1. Input image.
% 2. Pre-process image.
    % 1. Gray image
    % 2. Double image
    % 3. Alternate positive-negative in image pixels
% 3. Fourier transform image.
% 4. Create filter.
% 5. Filter image.
% 6. Inverse fourier transform image.
% 7. Post-process image.
% 8. Output image.
%% 1. Input image.
A = imread('Unknown.jpg');
subplot(1,5,1)
imshow(A)
title('RGB image')
%% 2. Pre-process image.
% Alternate positive-negative in image pixels
Ag = rgb2gray(A);
subplot(1,5,2)
imshow(Ag)
title('Gray image')
Agd = double(Ag);
subplot(1,5,3)
imshow(Agd)
title('Double image')
[row,col] = size(Agd);
for i=1:row
    for j=1:col
        Agda(i,j) = Agd(i,j) * (-1)^(i+j);
    end
end
subplot(1,5,4)
imshow(Agda)
title('Pre-processed image')
%% 3. Fourier transform image. DFT
% time-domain to frequency-domain. Introduces a complex part.
Agda_dft = fft2(Agda);
subplot(1,5,5)
imshow(Agda_dft)
title('Fourier transformed image')
%% 4. Create filter.
filter_high = zeros(row,col); % All zero
filter_low = ones(row,col); % All one
cut_freq = 10; % Cut-off frequency
for i=1:row
    for j=1:col
        distance = ((row/2-i)^2+(col/2-j)^2)^0.5;
        if(distance>cut_freq)
            filter_high(i,j) = 1;
            filter_low(i,j) = 0;
        end
    end
end
subplot(1,2,1)
imshow(filter_high)
title('High Pass Filter')
subplot(1,2,2)
imshow(filter_low)
title('Low Pass Filter')
%% 5. Filter image.
filtered_high = Agda_dft.*filter_high;
filtered_low = Agda_dft.*filter_low;
subplot(1,2,1)
imshow(filtered_high)
title('High Pass Filtered Image')
subplot(1,2,2)
imshow(filtered_low)
title('Low Pass Filtered Image')
%% 6. Inverse fourier transform image.
filtered_high_idft = ifft2(filtered_high);
filtered_low_idft = ifft2(filtered_low);
subplot(1,2,1)
imshow(filtered_high_idft)
title('filtered high idft')
subplot(1,2,2)
imshow(filtered_low_idft)
title('filtered low idft')
%% 7. Post-process image.
final_high = uint8(filtered_high_idft);
final_low = uint8(filtered_low_idft);

%for i=1:row
%   for j=1:col
%        filtered_high_idft(i,j) = filtered_high_idft(i,j) * (-1)^(i+j);
%        final_low(i,j) = filtered_low_idft(i,j) * (-1)^(i+j);
%    end
subplot(121)
imshow(final_high)
title('Sharpened image')
subplot(122)
imshow(final_low)
title('Smoothed image')
%% 8. Output sharpened high pass filtered image. 
subplot(1,4,1)
imshow(A)
title('Input image')
subplot(1,4,2)
imshow(Agda_dft)
title('Fourier transformed image')
subplot(1,4,3)
imshow(filter_high)
title('High pass filter')
subplot(1,4,4)
imshow(final_high)
title('Sharpened image')
%% 9. Output smoothed low pass filtered image. 
subplot(1,4,1)
imshow(A)
title('Input image')
subplot(1,4,2)
imshow(Agda_dft)
title('Fourier transformed image')
subplot(1,4,3)
imshow(filter_low)
title('Low pass filter')
subplot(1,4,4)
imshow(final_low)
title('Smoothed image')