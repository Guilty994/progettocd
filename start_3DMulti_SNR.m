addpath('./script/');
addpath("./script/YUV/");

hologram_path = './dataset/3D_Multi/';
hologram_name = 'Hol_3D_multi';

addpath(hologram_path);

codec_path = './codec/';
addpath(codec_path);

load(strcat(hologram_name, '.mat'));

matrix_to_pgm(Hol,hologram_path,hologram_name);

[real_matrix, imag_matrix] = split_complex(Hol);

real_matrix_rescaled_255 = rescale(real_matrix,0, 255);
imag_matrix_rescaled_255 = rescale(imag_matrix,0, 255);

%snr_values = calculate_SNR(real_matrix_rescaled_255, 1080, 1920, hologram_name, hologram_path, codec_path)

%conversione in formato hevc matrice reale 

%codifica con hevc

%decodifica con hevc
%riconversione in matrici grezze

%calcolo snr





