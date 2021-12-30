%% init
addpath('./script/benchmark_utils/');
addpath('./benchmark/file_sizes/');

%% 3d cat
% raw
size_RAW_Hol_3D_cat_real=dir('./dataset/Interfere1/3D_Cat/yuv/RAW_Hol_3D_cat_real.yuv').bytes
size_RAW_Hol_3D_cat_imag=dir('./dataset/Interfere1/3D_Cat/yuv/RAW_Hol_3D_cat_imag.yuv').bytes

% hevc
size_HEVC_Hol_3D_cat_real = hevc_cr_gather('./dataset/Interfere1/3D_Cat', 'real')
size_HEVC_Hol_3D_cat_imag = hevc_cr_gather('./dataset/Interfere1/3D_Cat', 'imag')

% JPEG2000
size_jpeg2000_Hol_3D_cat_real = jpeg2000_cr_gather('./dataset/Interfere1/3D_Cat', 'real', 'Hol_3D_cat')
size_jpeg2000_Hol_3D_cat_imag = jpeg2000_cr_gather('./dataset/Interfere1/3D_Cat', 'imag', 'Hol_3D_cat')

% libaom

size_libaom_Hol_3D_cat_real = libaom_cr_gather('./dataset/Interfere1/3D_Cat', 'real')
size_libaom_Hol_3D_cat_imag = libaom_cr_gather('./dataset/Interfere1/3D_Cat', 'imag')

%% 3d multi
% raw
size_RAW_Hol_3D_multi_real=dir('./dataset/Interfere1/3D_Multi/yuv/RAW_Hol_3D_multi_real.yuv').bytes
size_RAW_Hol_3D_multi_imag=dir('./dataset/Interfere1/3D_Multi/yuv/RAW_Hol_3D_multi_imag.yuv').bytes

% hevc
size_HEVC_Hol_3D_multi_real = hevc_cr_gather('./dataset/Interfere1/3D_Multi', 'real')
size_HEVC_Hol_3D_multi_imag = hevc_cr_gather('./dataset/Interfere1/3D_Multi', 'imag')

% JPEG2000
size_jpeg2000_Hol_3D_multi_real = jpeg2000_cr_gather('./dataset/Interfere1/3D_Multi', 'real', 'Hol_3D_Multi')
size_jpeg2000_Hol_3D_multi_imag = jpeg2000_cr_gather('./dataset/Interfere1/3D_Multi', 'imag', 'Hol_3D_Multi')

% libaom
size_libaom_Hol_3D_multi_real = libaom_cr_gather('./dataset/Interfere1/3D_Multi', 'real')
size_libaom_Hol_3D_multi_imag = libaom_cr_gather('./dataset/Interfere1/3D_Multi', 'imag')

% svt
size_svt_Hol_3D_multi_real = svt_cr_gather('./dataset/Interfere1/3D_Multi', 'real')
size_svt_Hol_3D_multi_imag = svt_cr_gather('./dataset/Interfere1/3D_Multi', 'imag')


%% 3d venus
% raw
size_RAW_Hol_3D_venus_real=dir('./dataset/Interfere1/3D_Venus/yuv/RAW_Hol_3D_venus_real.yuv').bytes
size_RAW_Hol_3D_venus_imag=dir('./dataset/Interfere1/3D_Venus/yuv/RAW_Hol_3D_venus_imag.yuv').bytes

% hevc
size_HEVC_Hol_3D_venus_real = hevc_cr_gather('./dataset/Interfere1/3D_Venus', 'real')
size_HEVC_Hol_3D_venus_imag = hevc_cr_gather('./dataset/Interfere1/3D_Venus', 'imag')

% JPEG2000
size_jpeg2000_Hol_3D_venus_real = jpeg2000_cr_gather('./dataset/Interfere1/3D_Venus', 'real', 'Hol_3D_Venus')
size_jpeg2000_Hol_3D_venus_imag = jpeg2000_cr_gather('./dataset/Interfere1/3D_Venus', 'imag', 'Hol_3D_Venus')

% libaom
size_libaom_Hol_3D_venus_real = libaom_cr_gather('./dataset/Interfere1/3D_Venus', 'real')
size_libaom_Hol_3D_venus_imag = libaom_cr_gather('./dataset/Interfere1/3D_Venus', 'imag')

% svt
size_svt_Hol_3D_venus_real = svt_cr_gather('./dataset/Interfere1/3D_Venus', 'real')
size_svt_Hol_3D_venus_imag = svt_cr_gather('./dataset/Interfere1/3D_Venus', 'imag')

%% cat8kd
% raw
size_RAW_Hol_8KD_cat_real=dir('./dataset/Interfere2/cat8KD/yuv/RAW_Hol_cat_8KD_real.yuv').bytes
size_RAW_Hol_8KD_cat_imag=dir('./dataset/Interfere2/cat8KD/yuv/RAW_Hol_cat_8KD_imag.yuv').bytes

% hevc
size_HEVC_Hol_8KD_cat_real = hevc_cr_gather('./dataset/Interfere2/cat8KD', 'real')
size_HEVC_Hol_8KD_cat_imag = hevc_cr_gather('./dataset/Interfere2/cat8KD', 'imag')

% JPEG2000
size_jpeg2000_Hol_8KD_cat_real = jpeg2000_cr_gather('./dataset/Interfere2/cat8KD', 'real', 'Hol_cat_8KD')
size_jpeg2000_Hol_8KD_cat_imag = jpeg2000_cr_gather('./dataset/Interfere2/cat8KD', 'imag', 'Hol_cat_8KD')

% libaom

size_libaom_Hol_8KD_cat_real = libaom_cr_gather('./dataset/Interfere2/cat8KD', 'real')
size_libaom_Hol_8KD_cat_imag = libaom_cr_gather('./dataset/Interfere2/cat8KD', 'imag')

%% venus8kd

% raw
size_RAW_Hol_8KD_venus_real=dir('./dataset/Interfere2/venus8KD/yuv/RAW_Hol_venus_8KD_real.yuv').bytes
size_RAW_Hol_8KD_venus_imag=dir('./dataset/Interfere2/venus8KD/yuv/RAW_Hol_venus_8KD_imag.yuv').bytes

% hevc
size_HEVC_Hol_8KD_venus_real = hevc_cr_gather('./dataset/Interfere2/venus8KD', 'real')
size_HEVC_Hol_8KD_venus_imag = hevc_cr_gather('./dataset/Interfere2/venus8KD', 'imag')

% JPEG2000
size_jpeg2000_Hol_8KD_venus_real = jpeg2000_cr_gather('./dataset/Interfere2/venus8KD', 'real', 'Hol_venus_8KD')
size_jpeg2000_Hol_8KD_venus_imag = jpeg2000_cr_gather('./dataset/Interfere2/venus8KD', 'imag', 'Hol_venus_8KD')

% libaom

size_libaom_Hol_8KD_venus_real = libaom_cr_gather('./dataset/Interfere2/venus8KD', 'real')
size_libaom_Hol_8KD_venus_imag = libaom_cr_gather('./dataset/Interfere2/venus8KD', 'imag')


%% save
save('benchmark\file_sizes\sizes.mat')
