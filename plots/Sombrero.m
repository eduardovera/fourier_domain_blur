function [ out ] = Sombrero( p )
%SOMBRERO Summary of this function goes here
%   Detailed explanation goes here
out = 2 * besselj(1, pi * p) ./ (pi * p);
end

