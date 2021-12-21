%% DEBUG ( 0 -> off, 1 -> on)

DEBUG = 1;
addpath('./debug/');

%% SETUP

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

min_raw_complex_real = min(min(real_matrix));
max_raw_complex_real = max(max(real_matrix));

min_raw_complex_imag = min(min(imag_matrix));
max_raw_complex_imag = max(max(imag_matrix));

wlen = 6.328e-07; % wave length
area = 0.8; % area (?)
zrec = 0.492015551750677; % reconstruction distance
height = 1080; % hologram height (px)
width = 1920;  % hologram width (px)

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

%function require not rescaled matrix (rescaling is performed inside encode_decode_JPEG2000 function)
matrices_regen_jpeg2000_real = encode_decode_JPEG2000(real_matrix, hologram_name, hologram_path, 'real');
matrices_regen_jpeg2000_imag = encode_decode_JPEG2000(imag_matrix, hologram_name, hologram_path, 'imag');
jpeg2000_SNRs_real = calculate_SNR(real_matrix,matrices_regen_jpeg2000_real)
jpeg2000_SNRs_imag = calculate_SNR(imag_matrix,matrices_regen_jpeg2000_imag)

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

% Regenerated vanilla hologram (punto 4)
hologram_vanilla = generate_bin(hologram_path, strcat(hologram_name,'_vanilla'),Hol,height, width, wlen, area, zrec);
reconstruction_vanilla = hologram_reconstruction(hologram_path,strcat(hologram_name,'_vanilla'), height, width, wlen, area);


% Regenerated vanilla rescaled hologram %% why??
raw_rescaled_complex = complex(real_matrix_rescaled_255, imag_matrix_rescaled_255);
hologram_rescaled_vanilla = generate_bin(hologram_path, strcat(hologram_name,'_rescaled_vanilla'),raw_rescaled_complex,height, width, wlen, area, zrec);
reconstruction_rescaled_vanilla = hologram_reconstruction(hologram_path,strcat(hologram_name,'_rescaled_vanilla'), height, width, wlen, area);
% -- END of RENDERING BLOCK (for raw complex matrix) --

%% COMPLEX REGENERATION and RENDERING BLOCK (for HEVC regenerated complex matrix)

% ripristino i range originali
matrices_regen_hevc_real{1} = rescale(matrices_regen_hevc_real{1},min_raw_complex_real, max_raw_complex_real);
matrices_regen_hevc_imag{1} = rescale(matrices_regen_hevc_imag{1},min_raw_complex_imag, max_raw_complex_imag);

matrix_regen_hevc_complex = complex(matrices_regen_hevc_real{1}, matrices_regen_hevc_imag{1});
hologram_HEVC = generate_bin(hologram_path, strcat(hologram_name,'_HEVC'),matrix_regen_hevc_complex,height, width, wlen, area, zrec);
% Reconstruction using ASM
reconstruction_HEVC = hologram_reconstruction(hologram_path,strcat(hologram_name,'_HEVC'), height, width, wlen, area);
% -- END of COMPLEX REGENERATION and RENDERING BLOCK (for HEVC regenerated complex matrix) --

%% COMPLEX REGENERATION and RENDERING BLOCK (for SVT-AV1 regenerated complex matrix)

matrix_regen_svt_av1_complex = complex(matrices_regen_svt_av1_real{1}, matrices_regen_svt_av1_imag{1});
hologram_SVT_AV1 = generate_bin(hologram_path, strcat(hologram_name,'_SVT_AV1'),matrix_regen_svt_av1_complex,height, width, wlen, area, zrec);
% Reconstruction using ASM
reconstruction_SVT_AV1 = hologram_reconstruction(hologram_path,strcat(hologram_name,'_SVT_AV1'), height, width, wlen, area);
% -- END of COMPLEX REGENERATION and RENDERING BLOCK (for SVT-AV1 regenerated complex matrix) --

%% COMPLEX REGENERATION and RENDERING BLOCK (for LIBAOM-AV1 regenerated complex matrix)

matrix_regen_libaom_av1_complex = complex(matrices_regen_libaom_av1_real{1}, matrices_regen_libaom_av1_imag{1});
hologram_libaom_av1 = generate_bin(hologram_path, strcat(hologram_name,'_LIBAOM_AV1'),matrix_regen_libaom_av1_complex,height, width, wlen, area, zrec);
% Reconstruction using ASM
reconstruction_libaom_av1 = hologram_reconstruction(hologram_path,strcat(hologram_name,'_LIBAOM_AV1'), height, width, wlen, area);
% -- END of COMPLEX REGENERATION and RENDERING BLOCK (for LIBAOM-AV1 regenerated complex matrix) --

%% COMPLEX REGENERATION and RENDERING BLOCK (for JPEG2000 regenerated complex matrix)

hologram_JPEG2000 = {};
reconstruction_JPEG2000 = {};
size_matrices_regen_jpeg2000_real = size(matrices_regen_jpeg2000_real);
for i = 1:size_matrices_regen_jpeg2000_real(2)
    matrices_regen_jpeg2000_real{i} = rescale(matrices_regen_jpeg2000_real{i},min_raw_complex_real, max_raw_complex_real);
    matrices_regen_jpeg2000_imag{i} = rescale(matrices_regen_jpeg2000_imag{i},min_raw_complex_imag, max_raw_complex_imag);
    
    matrix_regen_jpeg2000_complex = complex(matrices_regen_jpeg2000_real{i}, matrices_regen_jpeg2000_imag{i});
    hologram_JPEG2000{i} = generate_bin(hologram_path, strcat(hologram_name,'_JPEG2000'), matrix_regen_jpeg2000_complex, height, width, wlen, area, zrec);
    % Reconstruction using ASM
    reconstruction_JPEG2000{i} = hologram_reconstruction(hologram_path, strcat(hologram_name,'_JPEG2000'), height, width, wlen, area);
end
'fine'
% -- END of COMPLEX REGENERATION and RENDERING BLOCK (for JPEG 2000 regenerated complex matrix) --

%% PSNR calculations

%calculated_psnr_hevc = psnr(reconstruction_HEVC,reconstruction_rescaled_vanilla)


%calculated_psnr_hevc = psnr(reconstruction_HEVC,reconstruction_vanilla, max(max(reconstruction_HEVC)))

%calculated_psnr_libaom_av1 = psnr(reconstruction_libaom_av1,reconstruction_rescaled_vanilla)

% calculated_psnr_svt_av1 = psnr(reconstruction_SVT_AV1,reconstruction_rescaled_vanilla)

 calculated_psnr_jpeg2000 = {};
 for i = 1:size_matrices_regen_jpeg2000_real(2)
     calculated_psnr_jpeg2000{i} = psnr(reconstruction_JPEG2000{i},reconstruction_vanilla, 255);
 end
 calculated_psnr_jpeg2000

