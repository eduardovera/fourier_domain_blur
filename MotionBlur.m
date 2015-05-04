function [ ft] = MotionBlur( ft, L, T, wx0, wy0, inverse )
%MOTIONBLUR Summary of this function goes here
%   Detailed explanation goes here
[rows, cols] = size(ft);

origin_wx = -cols / 2 + 1;
origin_wy = -rows / 2 + 1;
dest_wx = cols / 2;
dest_wy = rows / 2;
H = zeros(size(ft));
    for wy = origin_wy:dest_wy
        for wx = origin_wx:dest_wx
%            H(wy + rows / 2, wx + cols / 2) = pi * sinc(wx .* L / pi);
            H(wy + rows / 2, wx + cols / 2) = T * sinc((wx * wx0) + (wy * wy0)) .* exp(-1i * pi * ((wx * wx0) + (wy * wy0)));
        end
    end
figure

if (inverse)
    H = imcomplement(H);
end


imshow(H);
colormap gray
title('Modulation Transfer Function')
ft = ft .* ifftshift(H);
end

