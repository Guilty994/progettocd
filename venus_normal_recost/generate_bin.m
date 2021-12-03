N = 1080;                   % number of pixels
M = 1920;
lambda = 6.328000000000000e-07;
area = 0.8;      % area sidelength in meter
z = 0.4981;                  % z in meter

prop = Propagator(N, M, lambda, area, z);

FlippedHol = flip(Hol);
FlippedHol = flip(FlippedHol, 2);

U = IFT2Dc(FT2Dc(FlippedHol).*prop);
hologram = abs(U).^2;

%figure, imshow(hologram, []);

fid = fopen(strcat('bin/b_hologram.bin'), 'w');
fwrite(fid, hologram, 'real*4');
fclose(fid);

p = hologram;
p = 255*(p - min(min(p)))/(max(max(p)) - min(min(p)));
imwrite (p, gray, 'jpeg/b_hologram.jpg');