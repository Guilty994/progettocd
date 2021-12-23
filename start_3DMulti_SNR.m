%% DEBUG ( 0 -> off, 1 -> on)

DEBUG = 1;
addpath('./debug/');

%% SETUP

% # of codec run/step/call
Q_SIZE = 7;

addpath('./script/');
addpath("./script/YUV/");
addpath("./script/TF/"); % Fourier transform
hologram_path = './dataset/Interfere1/3D_Multi/';
hologram_name = 'Hol_3D_multi';
addpath(hologram_path);
codec_path = './codec/';
addpath(codec_path);

load(strcat(hologram_name, '.mat')); % Hol_3D_multi.mat

% complex matrix splitting in real part and imaginary part
[real_matrix, imag_matrix] = split_complex(Hol);

% real matrix and imaginary matrix rescaling %
% Probabilmente invece di fare il rescale dobbiamo fare quella che
% trasforma in image la matrice
real_matrix_rescaled_255 = rescale(real_matrix,0,255);
imag_matrix_rescaled_255 = rescale(imag_matrix,0,255);
real_matrix_rescaled_0_1 = rescale(real_matrix,0,1);
imag_matrix_rescaled_0_1 = rescale(imag_matrix,0,1);

min_raw_complex_real = min(min(real_matrix));
max_raw_complex_real = max(max(real_matrix));

min_raw_complex_imag = min(min(imag_matrix));
max_raw_complex_imag = max(max(imag_matrix));

wlen = 6.328e-07; % wave length
zrec = 0.492015551750677; % reconstruction distance
height = 1080; % hologram height (px)
width = 1920;  % hologram width (px)
area = (1080*1920*pitch); % area (?)

%% Clear directories

clear_output_dir

%% HEVC
matrices_regen_hevc_real = encode_decode_HEVC(real_matrix_rescaled_255, height, width, hologram_name, hologram_path, 'real')
matrices_regen_hevc_imag = encode_decode_HEVC(imag_matrix_rescaled_255, height, width, hologram_name, hologram_path, 'imag')
hevc_SNRs_real = calculate_SNR(real_matrix_rescaled_255,matrices_regen_hevc_real)
hevc_SNRs_imag = calculate_SNR(imag_matrix_rescaled_255,matrices_regen_hevc_imag)

%% DEBUG HEVC
if DEBUG == 1
    debug_hevc
end
% -- end DEBUG HEVC --

%% JPEG2000

% %function require not rescaled matrix (rescaling is performed inside encode_decode_JPEG2000 function)
matrices_regen_jpeg2000_real = encode_decode_JPEG2000(real_matrix_rescaled_0_1, hologram_name, hologram_path, 'real');
matrices_regen_jpeg2000_imag = encode_decode_JPEG2000(imag_matrix_rescaled_0_1, hologram_name, hologram_path, 'imag');
jpeg2000_SNRs_real = calculate_SNR(real_matrix_rescaled_255,matrices_regen_jpeg2000_real)
jpeg2000_SNRs_imag = calculate_SNR(imag_matrix_rescaled_255,matrices_regen_jpeg2000_imag)

%% DEBUG JPEG2000

if DEBUG == 1
    debug_jpeg2000
end
% -- end DEBUG JPEG2000 --

%% SVT-AV1

matrices_regen_svt_av1_real = encode_decode_SVT_AV1(real_matrix_rescaled_255, height, width, hologram_name, hologram_path, 'real')
matrices_regen_svt_av1_imag = encode_decode_SVT_AV1(imag_matrix_rescaled_255, height, width, hologram_name, hologram_path, 'imag')
svt_av1_SNRs_real = calculate_SNR(real_matrix_rescaled_255,matrices_regen_svt_av1_real)
svt_av1_SNRs_imag = calculate_SNR(imag_matrix_rescaled_255,matrices_regen_svt_av1_imag)

%% DEBUG SVT-AV1
if DEBUG == 1
    debug_svt_av1
end
% -- end DEBUG SVT-AV1 --

%% LIBAOM_AV1

matrices_regen_libaom_av1_real = encode_decode_AV1_libaom(real_matrix_rescaled_255, height, width, hologram_name, hologram_path, 'real')
matrices_regen_libaom_av1_imag = encode_decode_AV1_libaom(imag_matrix_rescaled_255, height, width, hologram_name, hologram_path, 'imag')
libaom_av1_SNRs_real = calculate_SNR(real_matrix_rescaled_255,matrices_regen_libaom_av1_real)
libaom_av1_SNRs_imag = calculate_SNR(imag_matrix_rescaled_255,matrices_regen_libaom_av1_imag)

%% DEBUG LIBAOM_AV1

if DEBUG == 1
    debug_libaom_av1
end
% -- end DEBUG LIBAOM_AV1 --

%% CALCOLO PSNR
% 1. (PER OGNI CODEC) Prendere le matrici reale ed immaginaria decompresse e dequantizzarle
%    e ripammarle al loro range originale --> QUANDO VIENE EFFETTUATO QUESTO PUNTO?
% 2. combinare le due matrici decompresse in un'unica matrice complessa
% 3. effettuare ricostruzione numerica con ASM della matrice complessa ottenuta al punto 2.
% 4. effettuare ricostruzione numerica con ASM della matrice complessa iniziale (raw hologram)
% 5. effettuare il calcolo PSNR tra la matrice ottenuta al punto 4. e quella ottenuta al punto 3.

%% RENDERING BLOCK (for raw complex matrix)
'START RENDERING BLOCK (for raw complex matrix)'
% Reconstruction vanilla hologram
reconstruction_vanilla = hologram_reconstruction(hologram_path,strcat(hologram_name,'_vanilla'), height, width, wlen, area, zrec, Hol);
'END RENDERING BLOCK (for raw complex matrix)'
% -- END of RENDERING BLOCK (for raw complex matrix) --

%% COMPLEX REGENERATION and RENDERING BLOCK (for HEVC regenerated complex matrix)
'START COMPLEX REGENERATION and RENDERING BLOCK (for HEVC regenerated complex matrix)'
reconstruction_HEVC = {};
size_matrices_regen_HEVC_real = size(matrices_regen_hevc_real);
for i = 1:size_matrices_regen_HEVC_real(2)
    % Range remapping 
    matrices_regen_hevc_real_ripristined_range = rescale(matrices_regen_hevc_real{i},min_raw_complex_real, max_raw_complex_real);
    matrices_regen_hevc_imag_ripristined_range = rescale(matrices_regen_hevc_imag{i},min_raw_complex_imag, max_raw_complex_imag);
    % Complex representation reconstruction
    matrix_regen_hevc_complex = complex(matrices_regen_hevc_real_ripristined_range, matrices_regen_hevc_imag_ripristined_range);
    % Reconstruction using ASM
    reconstruction_HEVC{i} = hologram_reconstruction(hologram_path,strcat(hologram_name,'_q_',int2str(i),'_HEVC'), height, width, wlen, area, zrec, matrix_regen_hevc_complex);
end
'END COMPLEX REGENERATION and RENDERING BLOCK (for HEVC regenerated complex matrix)'
% -- END of COMPLEX REGENERATION and RENDERING BLOCK (for HEVC regenerated complex matrix) --

%% COMPLEX REGENERATION and RENDERING BLOCK (for SVT-AV1 regenerated complex matrix)

'START COMPLEX REGENERATION and RENDERING BLOCK (for SVT-AV1 regenerated complex matrix)'

reconstruction_SVT_AV1 = {};
size_matrices_regen_SVT_AV1_real = size(matrices_regen_svt_av1_real);
for i = 1:size_matrices_regen_SVT_AV1_real(2)
    % Range remapping 
    matrices_regen_svt_av1_real_ripristined_range = rescale(matrices_regen_svt_av1_real{i},min_raw_complex_real, max_raw_complex_real);
    matrices_regen_svt_av1_imag_ripristined_range = rescale(matrices_regen_svt_av1_imag{i},min_raw_complex_imag, max_raw_complex_imag);
    % Complex representation reconstruction
    matrix_regen_svt_av1_complex = complex(matrices_regen_svt_av1_real_ripristined_range, matrices_regen_svt_av1_imag_ripristined_range);
    % Reconstruction using ASM
    reconstruction_SVT_AV1{i} = hologram_reconstruction(hologram_path,strcat(hologram_name,'_q_',int2str(i),'_SVT_AV1'), height, width, wlen, area, zrec, matrix_regen_svt_av1_complex);
end

'END COMPLEX REGENERATION and RENDERING BLOCK (for SVT-AV1 regenerated complex matrix)'
% -- END of COMPLEX REGENERATION and RENDERING BLOCK (for SVT-AV1 regenerated complex matrix) --

%% COMPLEX REGENERATION and RENDERING BLOCK (for LIBAOM-AV1 regenerated complex matrix)
'START COMPLEX REGENERATION and RENDERING BLOCK (for LIBAOM-AV1 regenerated complex matrix)'

reconstruction_libaom_av1 = {};
size_matrices_regen_libaom_av1_real = size(matrices_regen_libaom_av1_real);
for i = 1:size_matrices_regen_libaom_av1_real(2)
    % Range remapping 
    matrices_regen_libaom_av1_real_ripristined_range = rescale(matrices_regen_libaom_av1_real{i},min_raw_complex_real, max_raw_complex_real);
    matrices_regen_libaom_av1_imag_ripristined_range = rescale(matrices_regen_libaom_av1_imag{i},min_raw_complex_imag, max_raw_complex_imag);
    % Complex representation reconstruction
    matrix_regen_libaom_av1_complex = complex(matrices_regen_libaom_av1_real_ripristined_range, matrices_regen_libaom_av1_imag_ripristined_range);
    % Reconstruction using ASM
    reconstruction_libaom_av1{i} = hologram_reconstruction(hologram_path,strcat(hologram_name,'_LIBAOM_AV1'), height, width, wlen, area, zrec, matrix_regen_libaom_av1_complex);
end

'END COMPLEX REGENERATION and RENDERING BLOCK (for LIBAOM-AV1 regenerated complex matrix)'
% -- END of COMPLEX REGENERATION and RENDERING BLOCK (for LIBAOM-AV1 regenerated complex matrix) --

%% COMPLEX REGENERATION and RENDERING BLOCK (for JPEG2000 regenerated complex matrix)
'Start COMPLEX REGENERATION and RENDERING BLOCK (for JPEG2000 regenerated complex matrix)'
reconstruction_JPEG2000 = {};
size_matrices_regen_jpeg2000_real = size(matrices_regen_jpeg2000_real);
for i = 1:size_matrices_regen_jpeg2000_real(2)
    % Range remapping
    matrices_regen_jpeg2000_real_ripristined_range = rescale(matrices_regen_jpeg2000_real{i},min_raw_complex_real, max_raw_complex_real);
    matrices_regen_jpeg2000_imag_ripristined_range = rescale(matrices_regen_jpeg2000_imag{i},min_raw_complex_imag, max_raw_complex_imag);
    % Complex representation reconstruction
    matrix_regen_jpeg2000_complex = complex(matrices_regen_jpeg2000_real_ripristined_range, matrices_regen_jpeg2000_imag_ripristined_range);
    % Reconstruction using ASM
    reconstruction_JPEG2000{i} = hologram_reconstruction(hologram_path, strcat(hologram_name,'_JPEG2000'), height, width, wlen, area, zrec, matrix_regen_jpeg2000_complex);
end
'End COMPLEX REGENERATION and RENDERING BLOCK (for JPEG2000 regenerated complex matrix)'
% -- END of COMPLEX REGENERATION and RENDERING BLOCK (for JPEG 2000 regenerated complex matrix) --

%% PSNR calculations

%calculated_psnr_hevc = cell(Q_SIZE);
calculated_psnr_libaom_av1 = cell(1, Q_SIZE);
calculated_psnr_svt_av1 = cell(1, Q_SIZE);
calculated_psnr_jpeg2000 = cell(1, Q_SIZE);

for i= 1:Q_SIZE
    %calculated_psnr_hevc{i} = psnr(reconstruction_HEVC{i},reconstruction_vanilla, max(max(reconstruction_HEVC{i})));
    calculated_psnr_libaom_av1{i} = psnr(reconstruction_libaom_av1{i},reconstruction_vanilla, max(max(reconstruction_libaom_av1{i})));
    calculated_psnr_svt_av1{i} = psnr(reconstruction_SVT_AV1{i},reconstruction_vanilla, max(max(reconstruction_SVT_AV1{i})));
    calculated_psnr_jpeg2000{i} = psnr(reconstruction_JPEG2000{i},reconstruction_vanilla, max(max(reconstruction_JPEG2000{i})));

end
%calculated_psnr_hevc
calculated_psnr_libaom_av1
calculated_psnr_svt_av1
calculated_psnr_jpeg2000