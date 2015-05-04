function [ ft ] = ProjectiveBlur( ft, R, inverse )
%PROJECTIVEBLUR Summary of this function goes here
%   Detailed explanation goes here
[rows, cols] = size(ft);

origin_wx = -cols / 2 + 1;
origin_wy = -rows / 2 + 1;
dest_wx = cols / 2;
dest_wy = rows / 2;
H = zeros(size(ft));
    for wy = origin_wy:dest_wy
        for wx = origin_wx:dest_wx
            R_rho = R .* sqrt(wx.^2 + wy.^2);
            if (R_rho ~= 0) 
                H(wy + rows / 2, wx + cols / 2) = 2 * besselj(1, R_rho) ./ R_rho;
            end
        end
    end
H(dest_wy, dest_wx) = 1;
figure

if (inverse)
    H = imcomplement(H);
end


imshow((H));
colormap gray
title('Modulation Transfer Function')
ft = ft .* ifftshift(H);
end

