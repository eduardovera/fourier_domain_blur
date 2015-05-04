function [ out ] = ProjectiveBlurModel( wx, wy, d, l, f)
%PROJECTIVEBLURMODEL Summary of this function goes here
%   Detailed explanation goes here

R_rho = ((d .* l) ./ (2 .* f)) .* sqrt(wx.^2 + wy.^2);

out = .5 * Sombrero(R_rho / pi);

end

