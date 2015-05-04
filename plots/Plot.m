wx = 0:255;
wy = 0:255;
wx = linspace(-127, 127, 1000);
wy = wx';
[X, Y] = meshgrid(wx, wy);

% GAUSSIAN PLOT
% sigma = 0.1;
% G = GaussianModel(X, Y, sigma);
% surf(X, Y, G);shading interp

% MOTION PLOT
% L = 10;
% M = MotionModelA(X, L);
% figure
% surf(X, Y, M); shading interp
% M = MotionModelB(wx, wy, 9, 0, 1);
% figure
% surf(X, Y, M); shading interp

% PROJECTIVE PLOT
P = ProjectiveBlurModel(X, Y, 5, 2, 20);
figure
surf(X, Y, P); shading interp




