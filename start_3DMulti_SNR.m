%% SETUP
addpath('./script/');
addpath("./script/YUV/");
addpath("./script/TF/"); % Fourier trasformata

hologram_path = './dataset/Interfere1/3D_Multi/';
hologram_name = 'Hol_3D_multi';

addpath(hologram_path);

codec_path = './codec/';
addpath(codec_path);

load(strcat(hologram_name, '.mat')); % Hol_3D_multi.mat

% complex matrix splitting in real part and imaginary part
[real_matrix, imag_matrix] = split_complex(Hol);

% real matrix and imaginary matrix rescaling
real_matrix_rescaled_255 = rescale(real_matrix,0,255);
imag_matrix_rescaled_255 = rescale(imag_matrix,0,255);

wlen = 6.328e-07; % wave length
area = 0.8;
zrec = 0.492015551750677; % reconstruction distance
height = 1080; % hologram height (px)
width = 1920;  % hologram width (px)

%% HEVC
%matrices_regen_hevc_real = encode_decode_HEVC(real_matrix_rescaled_255, height, width, hologram_name, hologram_path)
%matrices_regen_hevc_imag = encode_decode_HEVC(imag_matrix_rescaled_255, height, width, hologram_name, hologram_path)
%calculate_SNR(real_matrix,matrices_regen_hevc_real)
%calculate_SNR(imag_matrix,matrices_regen_hevc_imag)

%% JPEG2000
    % function require not rescaled matrix (rescaling is performed inside
    % encode_decode_JPEG2000 function)
%matrices_regen_jpeg2000_real = encode_decode_JPEG2000(real_matrix, hologram_name, hologram_path);
%matrices_regen_jpeg2000_imag = encode_decode_JPEG2000(imag_matrix, hologram_name, hologram_path);
%calculate_SNR(real_matrix,matrices_regen_jpeg2000_real)
%calculate_SNR(imag_matrix,matrices_regen_jpeg2000_imag)

%% SVT-AV1
%matrices_regen_svt_av1_real = encode_decode_SVT_AV1(real_matrix_rescaled_255, height, width, hologram_name, hologram_path)
%matrices_regen_svt_av1_imag = encode_decode_SVT_AV1(imag_matrix_rescaled_255, height, width, hologram_name, hologram_path)
%calculate_SNR(real_matrix,matrices_regen_svt_av1_real) %vedere se devo
%passare real matrix o real matrix rescaled 255
%calculate_SNR(imag_matrix,matrices_regen_svt_av1_imag)


%% LIBAOM_AV1
%matrices_regen_libaom_av1_real = encode_decode_AV1_libaom(real_matrix_rescaled_255, height, width, hologram_name, hologram_path)
%matrices_regen_libaom_av1_imag = encode_decode_AV1_libaom(imag_matrix_rescaled_255, height, width, hologram_name, hologram_path)
%calculate_SNR(imag_matrix,matrices_regen_libaom_av1_real)
%calculate_SNR(imag_matrix,matrices_regen_libaom_av1_imag)

%% CALCOLO PSNR
% 1. (PER OGNI CODEC) Prendere le matrici reale ed immaginaria decompresse e dequantizzarle
%    e ripammarle al loro range originale --> QUANDO VIENE EFFETTUATO QUESTO PUNTO?
% 2. combinare le due matrici decompresse in un'unica matrice complessa
% 3. effettuare ricostruzione numerica con ASM della matrice complessa ottenuta al punto 2.
% 4. effettuare ricostruzione numerica con ASM della matrice complessa iniziale (raw hologram)
% 5. effettuare il calcolo PSNR tra la matrice ottenuta al punto 4. e quella ottenuta al punto 3.


%% RENDERING BLOCK
% Regenerated vanilla (raw) hologram
hologram_vanilla = generate_bin(hologram_path, strcat(hologram_name,'_vanilla'),Hol,height, width, wlen, area, zrec);

% vanilla (raw) hologram reconstruction using ASM
reconstruction_vanilla = hologram_reconstruction(hologram_path,strcat(hologram_name,'_vanilla'), height, width, wlen, area);
% END of RENDERING BLOCK

%% COMPLEX REGENERATION and RENDERING BLOCK (for SVT-AV1)
%Regenerated SVT-AV1 encoded hologram
% LE MATRICI REALE ed IMMAGINARIA sono STATE RIPAMAPPATE AL LORO RANGE ORIGINALE?
matrix_regen_svt_av1_complex = complex(matrices_regen_svt_av1_real{1}, matrices_regen_svt_av1_imag{1});

hologram_SVT_AV1 = generate_bin(hologram_path, strcat(hologram_name,'_SVT_AV1'),matrix_regen_svt_av1_complex,height, width, wlen, area, zrec);

% Reconstruction using ASM
reconstruction_SVT_AV1 = hologram_reconstruction(hologram_path,strcat(hologram_name,'_SVT_AV1'), height, width, wlen, area);
% END of COMPLEX REGENERATION and RENDERING BLOCK (for SVT-AV1)

% function parameters: psnr(regenerated matrix (test), reference matrix)
calculated_psnr_svt_av1 = psnr(reconstruction_SVT_AV1,reconstruction_vanilla) 

%% COMPLEX REGENERATION and RENDERING BLOCK (for JPEG 2000)
% Regenerated JPEG 2000 encoded hologram
%matrix_regen_jpeg2000_complex = complex(matrices_regen_jpeg2000_real{1}, matrices_regen_jpeg2000_imag{1});

%hologram_JPEG2000 = generate_bin(hologram_path, strcat(hologram_name,'_JPEG2000'), matrix_regen_jpeg2000_complex, height, width, wlen, area, zrec);

%% Reconstruction using ASM
%reconstruction_JPEG2000 = hologram_reconstruction(hologram_path, strcat(hologram_name,'_JPEG2000'), height, width, wlen, area);
% function parameters: psnr(regenerated matrix (test), reference matrix)
%calculated_psnr_jpeg2000 = psnr(reconstruction_JPEG2000,reconstruction_vanilla) 
% END of COMPLEX REGENERATION and RENDERING BLOCK (for JPEG 2000)