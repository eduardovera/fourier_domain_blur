function [ ft, H] = MotionBlur( ft, L, theta )
%MOTIONBLUR Summary of this function goes here
%   Detailed explanation goes here
[rows, cols] = size(ft);

origin_wx = -cols / 2 + 1;
origin_wy = -rows / 2 + 1;
dest_wx = cols / 2;
dest_wy = rows / 2;
H = zeros(size(ft));
% theta = 2 * pi - theta;
for wy = origin_wy:dest_wy
    for wx = origin_wx:dest_wx
        H(wy + rows / 2, wx + cols / 2) = pi * sinc(((wx * cos(theta)) + (wy * sin(theta))) .* L / pi);
    end
end

figure
imshow(H);
colormap gray
title('Modulation Transfer Function')
H = ifftshift(H);
ft = ft .* H;