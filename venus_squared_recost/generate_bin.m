N = 1080;                   % number of pixels
lambda = 6.328000000000000e-07;
area = 0.01;             % area sidelength in meter
z = 0.6;                  % z in meter

prop = Propagator(N, lambda, area, z);
U = IFT2Dc(FT2Dc(fixed).*prop);
hologram = abs(U).^2;

figure, imshow(hologram, []);

fid = fopen(strcat('bin/b_hologram.bin'), 'w');
fwrite(fid, hologram, 'real*4');
fclose(fid);

p = hologram;
p = 255*(p - min(min(p)))/(max(max(p)) - min(min(p)));
imwrite (p, gray, 'jpeg/b_hologram.jpg');