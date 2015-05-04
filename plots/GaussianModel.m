function [ out ] = GaussianModel( wx, wy, sigma )
%GAUSSIAN Summary of this function goes here
%   Detailed explanation goes here
    out = exp( -0.5 * (wx.^2 + wy.^2) * (sigma.^2));
end

