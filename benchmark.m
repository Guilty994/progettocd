%% 3dcat

coding_3D_cat

%hevc
hevc_cat3d_SNR_real = hevc_SNRs_real;
hevc_cat3d_SNR_imag = hevc_SNRs_imag;
hevc_cat3d_PSNR = HEVC_psnr;

save('benchmark\hevc_cat3d_SNR_real.mat','hevc_cat3d_SNR_real');
save('benchmark\hevc_cat3d_SNR_imag.mat', 'hevc_cat3d_SNR_imag');
save('benchmark\hevc_cat3d_PSNR.mat', 'hevc_cat3d_PSNR');

%jpeg2000
jpeg2000_cat3d_SNR_real = jpeg2000_SNRs_real;
jpeg2000_cat3d_SNR_imag = jpeg2000_SNRs_imag;
jpeg2000_cat3d_PSNR = JPEG2000_psnr;

save('benchmark\jpeg2000_cat3d_SNR_real.mat','jpeg2000_cat3d_SNR_real');
save('benchmark\jpeg2000_cat3d_SNR_imag.mat', 'jpeg2000_cat3d_SNR_imag');
save('benchmark\jpeg2000_cat3d_PSNR.mat', 'jpeg2000_cat3d_PSNR');

%libaom
libaom_av1_cat3d_SNR_real = libaom_av1_SNRs_real;
libaom_av1_cat3d_SNR_imag = libaom_av1_SNRs_imag;
libaom_av1_cat3d_PSNR = libaom_AV1_psnr;

save('benchmark\libaom_av1_cat3d_SNR_real.mat','libaom_av1_cat3d_SNR_real');
save('benchmark\libaom_av1_cat3d_SNR_imag.mat', 'libaom_av1_cat3d_SNR_imag');
save('benchmark\libaom_av1_cat3d_PSNR.mat', 'libaom_av1_cat3d_PSNR');

clear
%% 3dmulti

coding_3D_Multi

%hevc
hevc_multi3d_SNR_real = hevc_SNRs_real;
hevc_multi3d_SNR_imag = hevc_SNRs_imag;
hevc_multi3d_PSNR = HEVC_psnr;

save('benchmark\hevc_multi3d_SNR_real.mat','hevc_multi3d_SNR_real');
save('benchmark\hevc_multi3d_SNR_imag.mat', 'hevc_multi3d_SNR_imag');
save('benchmark\hevc_multi3d_PSNR.mat', 'hevc_multi3d_PSNR');

%jpeg2000
jpeg2000_multi3d_SNR_real = jpeg2000_SNRs_real;
jpeg2000_multi3d_SNR_imag = jpeg2000_SNRs_imag;
jpeg2000_multi3d_PSNR = JPEG2000_psnr;

save('benchmark\jpeg2000_multi3d_SNR_real.mat','jpeg2000_multi3d_SNR_real');
save('benchmark\jpeg2000_multi3d_SNR_imag.mat', 'jpeg2000_multi3d_SNR_imag');
save('benchmark\jpeg2000_multi3d_PSNR.mat', 'jpeg2000_multi3d_PSNR');

%libaom
libaom_av1_multi3d_SNR_real = libaom_av1_SNRs_real;
libaom_av1_multi3d_SNR_imag = libaom_av1_SNRs_imag;
libaom_av1_multi3d_PSNR = libaom_AV1_psnr;

save('benchmark\libaom_av1_multi3d_SNR_real.mat','libaom_av1_multi3d_SNR_real');
save('benchmark\libaom_av1_multi3d_SNR_imag.mat', 'libaom_av1_multi3d_SNR_imag');
save('benchmark\libaom_av1_multi3d_PSNR.mat', 'libaom_av1_multi3d_PSNR');

%svt
svt_av1_multi3d_SNR_real = svt_av1_SNRs_real;
svt_av1_multi3d_SNR_imag = svt_av1_SNRs_imag;
svt_av1_multi3d_PSNR = SVT_AV1_psnr;

save('benchmark\svt_av1_multi3d_SNR_real.mat','svt_av1_multi3d_SNR_real');
save('benchmark\svt_av1_multi3d_SNR_imag.mat', 'svt_av1_multi3d_SNR_imag');
save('benchmark\svt_av1_multi3d_PSNR.mat', 'svt_av1_multi3d_PSNR');

clear

%% 3dvenus

coding_3D_venus

hevc_venus3d_SNR_real = hevc_SNRs_real;
hevc_venus3d_SNR_imag = hevc_SNRs_imag;
hevc_venus3d_PSNR = HEVC_psnr;

save('benchmark\hevc_venus3d_SNR_real.mat','hevc_venus3d_SNR_real');
save('benchmark\hevc_venus3d_SNR_imag.mat', 'hevc_venus3d_SNR_imag');
save('benchmark\hevc_venus3d_PSNR.mat', 'hevc_venus3d_PSNR');

%jpeg2000
jpeg2000_venus3d_SNR_real = jpeg2000_SNRs_real;
jpeg2000_venus3d_SNR_imag = jpeg2000_SNRs_imag;
jpeg2000_venus3d_PSNR = JPEG2000_psnr;

save('benchmark\jpeg2000_venus3d_SNR_real.mat','jpeg2000_venus3d_SNR_real');
save('benchmark\jpeg2000_venus3d_SNR_imag.mat', 'jpeg2000_venus3d_SNR_imag');
save('benchmark\jpeg2000_venus3d_PSNR.mat', 'jpeg2000_venus3d_PSNR');

%libaom
libaom_av1_venus3d_SNR_real = libaom_av1_SNRs_real;
libaom_av1_venus3d_SNR_imag = libaom_av1_SNRs_imag;
libaom_av1_venus3d_PSNR = libaom_AV1_psnr;

save('benchmark\libaom_av1_venus3d_SNR_real.mat','libaom_av1_venus3d_SNR_real');
save('benchmark\libaom_av1_venus3d_SNR_imag.mat', 'libaom_av1_venus3d_SNR_imag');
save('benchmark\libaom_av1_venus3d_PSNR.mat', 'libaom_av1_venus3d_PSNR');

%svt
svt_av1_venus3d_SNR_real = svt_av1_SNRs_real;
svt_av1_venus3d_SNR_imag = svt_av1_SNRs_imag;
svt_av1_venus3d_PSNR = SVT_AV1_psnr;

save('benchmark\svt_av1_venus3d_SNR_real.mat','svt_av1_venus3d_SNR_real');
save('benchmark\svt_av1_venus3d_SNR_imag.mat', 'svt_av1_venus3d_SNR_imag');
save('benchmark\svt_av1_venus3d_PSNR.mat', 'svt_av1_venus3d_PSNR');

clear

%% cat8kd

coding_cat8KD

%hevc
hevc_cat8kd_SNR_real = hevc_SNRs_real;
hevc_cat8kd_SNR_imag = hevc_SNRs_imag;
hevc_cat8kd_PSNR = HEVC_psnr;

save('benchmark\hevc_cat8kd_SNR_real.mat','hevc_cat8kd_SNR_real');
save('benchmark\hevc_cat8kd_SNR_imag.mat', 'hevc_cat8kd_SNR_imag');
save('benchmark\hevc_cat8kd_PSNR.mat', 'hevc_cat8kd_PSNR');

%jpeg2000
jpeg2000_cat8kd_SNR_real = jpeg2000_SNRs_real;
jpeg2000_cat8kd_SNR_imag = jpeg2000_SNRs_imag;
jpeg2000_cat8kd_PSNR = JPEG2000_psnr;

save('benchmark\jpeg2000_cat8kd_SNR_real.mat','jpeg2000_cat8kd_SNR_real');
save('benchmark\jpeg2000_cat8kd_SNR_imag.mat', 'jpeg2000_cat8kd_SNR_imag');
save('benchmark\jpeg2000_cat8kd_PSNR.mat', 'jpeg2000_cat8kd_PSNR');

%libaom
libaom_av1_cat8kd_SNR_real = libaom_av1_SNRs_real;
libaom_av1_cat8kd_SNR_imag = libaom_av1_SNRs_imag;
libaom_av1_cat8kd_PSNR = libaom_AV1_psnr;

save('benchmark\libaom_av1_cat8kd_SNR_real.mat','libaom_av1_cat8kd_SNR_real');
save('benchmark\libaom_av1_cat8kd_SNR_imag.mat', 'libaom_av1_cat8kd_SNR_imag');
save('benchmark\libaom_av1_cat8kd_PSNR.mat', 'libaom_av1_cat8kd_PSNR');

clear

%% venus8kd

coding_venus8KD

%hevc
hevc_venus8KD_SNR_real = hevc_SNRs_real;
hevc_venus8KD_SNR_imag = hevc_SNRs_imag;
hevc_venus8KD_PSNR = HEVC_psnr;

save('benchmark\hevc_venus8KD_SNR_real.mat','hevc_venus8KD_SNR_real');
save('benchmark\hevc_venus8KD_SNR_imag.mat', 'hevc_venus8KD_SNR_imag');
save('benchmark\hevc_venus8KD_PSNR.mat', 'hevc_venus8KD_PSNR');

%jpeg2000
jpeg2000_venus8KD_SNR_real = jpeg2000_SNRs_real;
jpeg2000_venus8KD_SNR_imag = jpeg2000_SNRs_imag;
jpeg2000_venus8KD_PSNR = JPEG2000_psnr;

save('benchmark\jpeg2000_venus8KD_SNR_real.mat','jpeg2000_venus8KD_SNR_real');
save('benchmark\jpeg2000_venus8KD_SNR_imag.mat', 'jpeg2000_venus8KD_SNR_imag');
save('benchmark\jpeg2000_venus8KD_PSNR.mat', 'jpeg2000_venus8KD_PSNR');

%libaom
libaom_av1_venus8KD_SNR_real = libaom_av1_SNRs_real;
libaom_av1_venus8KD_SNR_imag = libaom_av1_SNRs_imag;
libaom_av1_venus8KD_PSNR = libaom_AV1_psnr;

save('benchmark\libaom_av1_venus8KD_SNR_real.mat','libaom_av1_venus8KD_SNR_real');
save('benchmark\libaom_av1_venus8KD_SNR_imag.mat', 'libaom_av1_venus8KD_SNR_imag');
save('benchmark\libaom_av1_venus8KD_PSNR.mat', 'libaom_av1_venus8KD_PSNR');

clear