%% STD CALCULATION
addpath('benchmark\PSNR\');

% 3D Cat PSNR average
    % HEVC
    load('hevc_cat3d_PSNR.mat');
    std_HEVC_3D_cat = std(hevc_cat3d_PSNR);

    % JPEG2000
    load('jpeg2000_cat3d_PSNR.mat');
    std_JPEG2000_3D_cat = std(jpeg2000_cat3d_PSNR);

    % SVT-AV1 (NON APPLICABILE perché 8K)
    %load('svt_av1_cat3d_PSNR');
    %average_SVT_AV1_3D_cat = mean(svt_av1_cat3d_PSNR);

    % libaom AV1
    load('libaom_av1_cat3d_PSNR.mat');
    std_libaom_AV1_3D_cat = std(libaom_av1_cat3d_PSNR);

% 3D Multi PSNR average
    % HEVC
    load('hevc_multi3d_PSNR.mat');
    std_HEVC_3D_multi = std(hevc_multi3d_PSNR);

    % JPEG2000
    load('jpeg2000_multi3d_PSNR.mat');
    std_JPEG2000_3D_multi = std(jpeg2000_multi3d_PSNR);

    % SVT-AV1
    load('svt_av1_multi3d_PSNR.mat');
    std_SVT_AV1_3D_multi = std(svt_av1_multi3d_PSNR);

    % libaom AV1
    load('libaom_av1_multi3d_PSNR.mat');
    std_libaom_AV1_3D_multi = std(libaom_av1_multi3d_PSNR);

% 3D Venus PSNR average
    % HEVC
    load('hevc_venus3d_PSNR.mat');
    std_HEVC_3D_venus = std(venus3d_PSNR);

    % JPEG2000
    load('jpeg2000_venus3d_PSNR.mat');
    std_JPEG2000_3D_venus = std(jpeg2000_venus3d_PSNR);

    % SVT-AV1
    load('svt_av1_venus3d_PSNR.mat');
    std_SVT_AV1_3D_venus = std(svt_av1_venus3d_PSNR);

    % libaom AV1
    load('libaom_av1_venus3d_PSNR.mat');
    std_libaom_AV1_3D_venus = std(libaom_av1_venus3d_PSNR);

% Cat 8KD PSNR average
    % HEVC
    load('hevc_cat8kd_PSNR.mat');
    std_HEVC_cat8KD = std(cat8kd_PSNR);

    % JPEG2000
    load('jpeg2000_cat8kd_PSNR.mat');
    std_JPEG2000_cat8KD = std(jpeg2000_cat8kd_PSNR);

    % SVT-AV1 (NON APPLICABILE perché 8K)
    %load('svt_av1_cat8kd_PSNR');
    %average_SVT_AV1_cat8KD = mean(svt_av1_cat8kd_PSNR);

    % libaom AV1
    load('libaom_av1_cat8kd_PSNR.mat');
    std_libaom_AV1_cat8KD = std(libaom_av1_cat8kd_PSNR);

% Venus 8KD PSNR average
    % HEVC
    load('hevc_venus8KD_PSNR.mat');
    std_HEVC_venus8KD = std(hevc_venus8KD_PSNR);

    % JPEG2000
    load('jpeg2000_venus8KD_PSNR.mat');
    std_JPEG2000_venus8KD = std(jpeg2000_venus8KD_PSNR);

    % SVT-AV1 (NON APPLICABILE perché 8K)
    %load('svt_av1_venus8KD_PSNR');
    %average_SVT_AV1_venus8KD = mean(svt_av1_venus8KD_PSNR);

    % libaom AV1
    load('libaom_av1_venus8KD_PSNR.mat');
    std_libaom_AV1_venus8KD = std(libaom_av1_venus8KD_PSNR);

    clear hevc_cat3d_PSNR hevc_multi3d_PSNR venus3d_PSNR cat8kd_PSNR hevc_venus8KD_PSNR
    clear jpeg2000_cat3d_PSNR jpeg2000_multi3d_PSNR jpeg2000_venus3d_PSNR jpeg2000_cat8kd_PSNR jpeg2000_venus8KD_PSNR
    clear svt_av1_multi3d_PSNR svt_av1_venus3d_PSNR
    clear libaom_av1_cat3d_PSNR libaom_av1_multi3d_PSNR libaom_av1_venus3d_PSNR libaom_av1_cat8kd_PSNR libaom_av1_venus8KD_PSNR

    save('benchmark/PSNR/std.mat');