addpath('./script/');
addpath("./script/YUV/");

hologram_path = './dataset/Interfere2/cat8KD/';
hologram_name = 'CGH_cat8KD';

addpath(hologram_path);

codec_path = './codec/';
addpath(codec_path);

load(strcat(hologram_name, '.mat'));

[real_matrix, imag_matrix] = split_complex(CGH.Hol);

real_matrix_rescaled_255 = rescale(real_matrix,0, 255);
imag_matrix_rescaled_255 = rescale(imag_matrix,0, 255);

%HEVC
%startclock = clock;
%snr_values_hevc_real = calculate_SNR_HEVC(real_matrix_rescaled_255, 8192, 8192, hologram_name, hologram_path)
%snr_values_hevc_imag = calculate_SNR_HEVC(imag_matrix_rescaled_255, 8192, 8192, hologram_name, hologram_path)
%endclock = clock;
%time = endclock-startclock


%JPEG2000
% function require not rescaled matrix
%snr_values_jpeg2000_real = calculate_SNR_JPEG2000(real_matrix, hologram_name, hologram_path)
%snr_values_jpeg2000_imag = calculate_SNR_JPEG2000(imag_matrix, hologram_name, hologram_path)

%AV1
snr_values_av1_real = calculate_SNR_AV1(real_matrix_rescaled_255, 8192, 8192, hologram_name, hologram_path)
%snr_values_av1_imag = calculate_SNR_AV1(imag_matrix_rescaled_255, 8192, 8192, hologram_name, hologram_path)





%conversione in formato hevc matrice reale 

%codifica con hevc

%decodifica con hevc
%riconversione in matrici grezze

%calcolo snr



