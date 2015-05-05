% READ IMAGE
space_domain = im2double(rgb2gray(imread('samples\horse.png')));
figure 
imshow(space_domain);
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
[frequency_domain, H] = GaussianBlur(frequency_domain, 0.09);

% MOTION BLUR
%frequency_domain = MotionBlur(frequency_domain, 0.5, 5, 0.1, 0.0, false);

% PROJECTIVE BLUR
%frequency_domain = ProjectiveBlur(frequency_domain, 0.19, false);

% DISPLAY RESULTS
figure
space_domain = real(ifft2(frequency_domain));
imshow(space_domain);
colormap gray
title('Blurred Image');

% INVERSE RESULTS
%[frequency_domain, ~] = GaussianBlur(frequency_domain, 0.09);
%frequency_domain = MotionBlur(frequency_domain, 5, 0.1, 0.000, true);
%frequency_domain = ProjectiveBlur(frequency_domain, 0.19, true);

[rows, cols] = size(H);
H_ = zeros(size(H));
for i = 1:cols
    for j = 1:rows
        if (H(j, i) < eps)
            H_(j, i) = 1;
        else 
            H_(j, i) = 1 / H(j, i);
        end
    end
end

H_ = mat2gray(H_);

frequency_domain = frequency_domain .* H_;
figure
space_domain = real(ifft2(frequency_domain));
imshow(mat2gray(space_domain));
colormap gray
title('Un-Blurred Image');
