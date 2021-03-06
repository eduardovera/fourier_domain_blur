wx = 0:255;
wy = 0:255;
wx = linspace(-127, 127, 1000);
wy = wx';
[X, Y] = meshgrid(wx, wy);

% GAUSSIAN PLOT
figure
sigma = 0.09;
G = GaussianModel(X, Y, sigma);
surf(X, Y, G);shading interp
title('H - GAUSSIAN');

% MOTION PLOT
figure
L = 0.5;
M = MotionModel(X, Y, L, 0);
surf(X, Y, M); shading interp
title('H - MOTION');

% PROJECTIVE PLOT
P = ProjectiveBlurModel(X, Y, 5, 2, 20);
figure
surf(X, Y, P); shading interp
title('H - PROJECTIVE');