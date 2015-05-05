function [ out ] = MotionModel( wx, wy, L, theta )
%MOTIONMODEL Summary of this function goes here
%   Detailed explanation goes here

out = pi * sinc(((wx * cos(theta)) + (wy * sin(theta))) .* L / pi);

end

