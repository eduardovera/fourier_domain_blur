function [ ft, H ] = GaussianBlur( ft, sigma )
%GAUSSIANBLUR Summary of this function goes here
%   Detailed explanation goes here
[rows, cols] = size(ft);
origin_wx = -cols / 2 + 1;
origin_wy = -rows / 2 + 1;
dest_wx = cols / 2;
dest_wy = rows / 2;
H = zeros(size(ft));
for wy = origin_wy:dest_wy
    for wx = origin_wx:dest_wx
        H(wy + rows / 2, wx + cols / 2) = exp( -0.5 * (wx^2 + wy^2) * sigma^2);
    end
end
    
H = mat2gray(H);
figure
imshow(H);
colormap gray
title('Modulation Transfer Function')
ft = ft .* ifftshift(H);