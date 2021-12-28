%% SETUP
% DEBUG ( 0 -> off, 1 -> on)
DEBUG = 0;
addpath('./debug/');

add_directory_path;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hologram_path = './dataset/Interfere2/venus8KD/';
hologram_name = 'Hol_venus_8KD';
addpath(hologram_path);

% Load here is different from previous dataset because the .mat file is
% organized in a different manner
load('CGH_venus8KD.mat'); % Hol_3D_cat.mat

% Preliminary phase
Hol = getfield(CGH,'Hol');
% complex matrix splitting in real part and imaginary part
[real_matrix, imag_matrix] = split_complex(Hol); % Hol is the complex matrix name in the .mat file

% Range mapping & quantization
range_mapping_and_quant;

% Hologram info
wlen = 6.33e-07; % wave length
zrec = 0.012933742170833; % reconstruction distance
height = 8192; % hologram height (px)
width = 8192;  % hologram width (px)
pitch = 1.0e-06; %pixel pitch
area = (height*width*pitch); % area (?)

% Clear directories
del_coding_files;

%% SNR calc + Complex regeneration and rendering + PSNR calc
% Siccome richiede molto tempo è consigliabile aprire lo script ed eseguire
% un pezzo alla volta come impostato nello script
SNR_PSNR_calc_CRR;