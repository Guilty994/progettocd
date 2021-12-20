

addpath('./script/');
addpath("./script/YUV/");
addpath("./script/TF/");

hologram_path = './dataset/Interfere1/3D_Multi/';
hologram_name = 'Hol_3D_multi';

addpath(hologram_path);

codec_path = './codec/';
addpath(codec_path);

load(strcat(hologram_name, '.mat'));

[real_matrix, imag_matrix] = split_complex(Hol);

real_matrix_rescaled_255 = rescale(real_matrix,0, 255);
imag_matrix_rescaled_255 = rescale(imag_matrix,0, 255);

wlen = 6.328000000000000e-07;
area = 0.8;
zrec = 0.492015551750677;
height = 1080;
width = 1920;

%HEVC
%startclock = clock;
%snr_values_hevc_real = calculate_SNR_HEVC(real_matrix_rescaled_255, height, 1920, hologram_name, hologram_path)
%snr_values_hevc_imag = calculate_SNR_HEVC(imag_matrix_rescaled_255, height, 1920, hologram_name, hologram_path)
%endclock = clock;
%time = endclock-startclock


%JPEG2000
% fucntion require not rescaled matrix
%matrices_regen_jpeg2000_real = encode_decode_JPEG2000(real_matrix, hologram_name, hologram_path);
%matrices_regen_jpeg2000_imag = encode_decode_JPEG2000(imag_matrix, hologram_name, hologram_path);
%calculate_SNR(real_matrix,matrices_regen_jpeg2000_real)
%calculate_SNR(imag_matrix,matrices_regen_jpeg2000_imag)

%svt_av1
matrices_regen_svt_av1_real = encode_decode_SVT_AV1(real_matrix_rescaled_255, height, width, hologram_name, hologram_path)
matrices_regen_svt_av1_imag = encode_decode_SVT_AV1(imag_matrix_rescaled_255, height, width, hologram_name, hologram_path)
%calculate_SNR(real_matrix,matrices_regen_svt_av1_real) %vedere se devo
%passare real matrix o real matrix rescaled 255
%calculate_SNR(imag_matrix,matrices_regen_svt_av1_imag)


%liaom av1
%snr_values_libaom_real = calculate_SNR_AV1_libaom(real_matrix_rescaled_255, height, 1920, hologram_name, hologram_path)
%snr_values_libaom_imag = calculate_SNR_AV1_libaom(imag_matrix_rescaled_255, height, 1920, hologram_name, hologram_path)

%psnr_values_jpeg2000_real = calculate_PSNR_JPEG2000(real_matrix, hologram_name, hologram_path, wlen, height, 1920, 0.8, zrec)



%% Regenerated vanilla hologram
hologram_vanilla = generate_bin(hologram_path, strcat(hologram_name,'_vanilla'),Hol,height, width, wlen, area, zrec);

%% Reconstruction using ASM
reconstruction_vanilla = hologram_reconstruction(hologram_path,strcat(hologram_name,'_vanilla'), height, width, wlen, area);

%% Regenerated SVT-AV1 encoded hologram

matrix_regen_svt_av1_complex = complex(matrices_regen_svt_av1_real{1}, matrices_regen_svt_av1_imag{1});

hologram_SVT_AV1 = generate_bin(hologram_path, strcat(hologram_name,'_SVT_AV1'),matrix_regen_svt_av1_complex,height, width, wlen, area, zrec);

%% Reconstruction using ASM
reconstruction_SVT_AV1 = hologram_reconstruction(hologram_path,strcat(hologram_name,'_SVT_AV1'), height, width, wlen, area);

calculated_psnr = psnr(reconstruction_SVT_AV1,reconstruction_vanilla)

%% Regenerated JPEG2000 encoded hologram

%matrix_regen_jpeg2000_complex = complex(matrices_regen_jpeg2000_real{1}, matrices_regen_jpeg2000_imag{1});

%hologram_JPEG2000 = generate_bin(hologram_path, strcat(hologram_name,'_JPEG2000'),matrix_regen_jpeg2000_complex,height, width, wlen, area, zrec);

%% Reconstruction using ASM
%reconstruction_JPEG2000 = hologram_reconstruction(hologram_path,strcat(hologram_name,'_JPEG2000'), height, width, wlen, area);
