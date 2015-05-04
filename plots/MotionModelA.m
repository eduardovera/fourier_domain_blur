function [ out ] = MotionModelA( wx, L )
%MOTIONMODEL Summary of this function goes here
%   Detailed explanation goes here

out = pi * sinc(wx .* L / pi);

end

