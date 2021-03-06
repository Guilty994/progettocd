%% SETUP
% DEBUG ( 0 -> off, 1 -> on)
DEBUG = 0;
addpath('./debug/');

add_directory_path;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hologram_path = './dataset/Interfere1/3D_Venus/';
hologram_name = 'Hol_3D_venus';
addpath(hologram_path);

load(strcat(hologram_name,'.mat')); % Hol_3D_venus.mat

% splitting complex matrix in real part and imaginary part
[real_matrix, imag_matrix] = split_complex(Hol); % Hol is the complex matrix name in the .mat file

% Range mapping & quantization
range_mapping_and_quant;

% Hologram info
wlen = 6.328e-07; % wavelength
zrec = 0.49811289395; % reconstruction distance
height = 1080; % hologram height (px)
width = 1920;  % hologram width (px)
area = (height*width*pitch); % area (?)

% Clear directories
del_coding_files;

%% SNR calc + Complex regeneration and rendering + PSNR calc
% Since it takes a lot of time it is advisable to open the script 
% and execute one piece at a time as set in the script
SNR_PSNR_calc_CRR;