% si posso aggiungere come parametri della funzione i valori N ed M
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [hologram] = generate_bin(dataset_path, filename, Hol, N, M, lambda, area, z)
%N = 1080;             % pixel height
%M = 1920;             % pixel width
%lambda = 6.3280e-07;  % wavelenght
%area = 0.8;           % area sidelength in meter
%z = 0.4981;           % z in meter

prop = Propagator(N, M, lambda, area, z);

FlippedHol = flip(Hol);
FlippedHol = flip(FlippedHol, 2);

U = IFT2Dc(FT2Dc(FlippedHol).*prop);
hologram = abs(U).^2;

%figure, imshow(hologram, []);

fid = fopen(strcat(dataset_path, 'bin/', filename,'.bin'), 'w');
fwrite(fid, hologram, 'real*4');
fclose(fid);

p = hologram;
p = 255*(p - min(min(p)))/(max(max(p)) - min(min(p)));
imwrite (p, gray, strcat(dataset_path,'jpeg/', filename,'.jpg'));