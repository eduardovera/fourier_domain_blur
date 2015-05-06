% READ IMAGE
space_domain = im2double(rgb2gray(imread('samples\baboon.png')));
figure 
imshow(space_domain);
title('Original Image')

% FOURIER TRANSFORM
frequency_domain = (fft2(space_domain));

% DISPLAY MAGNITUDE AND PHASE SPECTRES
figure
imshow(fftshift(abs(frequency_domain)), [0 255]);
colormap gray
title('Magnitude')
figure
imshow(fftshift(angle(frequency_domain)), [-pi, pi]);
colormap gray
title('Phase')

% GAUSSIAN BLUR
%[frequency_domain, H] = GaussianBlur(frequency_domain, 0.09);

% MOTION BLUR
%[frequency_domain, H] = MotionBlur(frequency_domain, 0.5, 3 * pi / 4);

% PROJECTIVE BLUR
[frequency_domain, H] = ProjectiveBlur(frequency_domain, 0.25);

% DISPLAY RESULTS
figure
imshow(fftshift(abs(frequency_domain)), [0 255]);
colormap gray
title('Magnitude')
figure
imshow(fftshift(angle(frequency_domain)), [-pi, pi]);
colormap gray
title('Phase')

figure
space_domain = real(ifft2(frequency_domain));
imshow(space_domain);
colormap gray
title('Blurred Image');

% INVERSE RESULTS
H_ = 1 ./ (H + 1e-308);
frequency_domain = frequency_domain .* H_;

figure
space_domain = real(ifft2(frequency_domain));
imshow((space_domain));
colormap gray
title('Un-Blurred Image');