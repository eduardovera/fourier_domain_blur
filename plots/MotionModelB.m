function [ out ] = MotionModelB( wx, wy, wx0, wy0, T)
%MOTIONMODELB Summary of this function goes here
%   Detailed explanation goes here

out = zeros(1000, 1000);
out(1, :) = T .* sinc((wx * wx0)) .* exp(-1i * pi * (wx * wx0));
end

