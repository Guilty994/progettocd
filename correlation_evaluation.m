% Load all datasets

% Interfere 1
    
    %% Hol_3D_cat.mat
    'Loading... Hol_3D_cat.mat'
    addpath('./script/');
    addpath('./dataset/Interfere1/3D_Cat/');
    load('Hol_3D_cat.mat'); 
    'Loading completed.'
    [Hol_3D_cat_real_matrix, Hol_3D_cat_imag_matrix] = split_complex(Hol);
    Hol_3D_cat_corr_real = corrcoef(Hol_3D_cat_real_matrix);
    Hol_3D_cat_corr_img = corrcoef(Hol_3D_cat_imag_matrix);

    figure('Name','Hol_3D_cat_corr_real','NumberTitle','off'), imshow(Hol_3D_cat_corr_real,[])
    colormap(jet)

    figure('Name','Hol_3D_cat_corr_img','NumberTitle','off'), imshow(Hol_3D_cat_corr_img,[])
    colormap(jet)
    
    %% Hol_3D_multi.mat
    'Loading... Hol_3D_multi.mat'
    addpath('./script/');
    addpath('./dataset/Interfere1/3D_Multi/');
    load('Hol_3D_multi.mat'); 
    'Loading completed.'
    [Hol_3D_multi_real_matrix, Hol_3D_multi_imag_matrix] = split_complex(Hol);
    Hol_3D_multi_corr_real = corrcoef(Hol_3D_multi_real_matrix);
    Hol_3D_multi_corr_img = corrcoef(Hol_3D_multi_imag_matrix);

    figure('Name','HHol_3D_multi_corr_real','NumberTitle','off'), imshow(Hol_3D_multi_corr_real,[])
    colormap(jet)

    figure('Name','Hol_3D_multi_corr_img','NumberTitle','off'), imshow(Hol_3D_multi_corr_img,[])
    colormap(jet)

    %% Hol_3D_cat.mat
    'Loading... Hol_3D_cat.mat'
    addpath('./script/');
    addpath('./dataset/Interfere1/3D_Venus/');
    load('Hol_3D_venus.mat'); 

    [Hol_3D_venus_real_matrix, Hol_3D_venus_imag_matrix] = split_complex(Hol);
    Hol_3D_venus_corr_real = corrcoef(Hol_3D_venus_real_matrix);
    Hol_3D_venus_corr_img = corrcoef(Hol_3D_venus_imag_matrix);

    figure('Name','Hol_3D_venus_corr_real','NumberTitle','off'), imshow(Hol_3D_venus_corr_real,[])
    colormap(jet)

    figure('Name','Hol_3D_venus_corr_img','NumberTitle','off'), imshow(Hol_3D_venus_corr_img,[])
    colormap(jet)

% Interfere 2

    %% CGH_cat8KD.mat
    'Loading... CGH_cat8KD.mat'
    addpath('./script/');
    addpath('./dataset/Interfere2/cat8KD/');
    load('CGH_cat8KD.mat');

    [CGH_cat8KD_real_matrix, CGH_cat8KD_imag_matrix] = split_complex(CGH.Hol);
    CGH_cat8KD_corr_real = corrcoef(CGH_cat8KD_real_matrix);
    CGH_cat8KD_corr_img = corrcoef(CGH_cat8KD_imag_matrix);

    figure('Name','CGH_cat8KD_corr_real','NumberTitle','off'), imshow(CGH_cat8KD_corr_real,[])
    colormap(jet)

    figure('Name','CGH_cat8KD_corr_img','NumberTitle','off'), imshow(CGH_cat8KD_corr_img,[])
    colormap(jet)


    %% CGH_cat8KD.mat
    'Loading... CGH_venus8KD.mat'
    addpath('./script/');
    addpath('./dataset/Interfere2/venus8KD/');
    load('CGH_venus8KD.mat');

    [CGH_venus8KD_real_matrix, CGH_venus8KD_imag_matrix] = split_complex(CGH.Hol);
    CGH_venus8KD_corr_real = corrcoef(CGH_venus8KD_real_matrix);
    CGH_venus8KD_corr_img = corrcoef(CGH_venus8KD_imag_matrix);

    figure('Name','CGH_venus8KD_corr_real','NumberTitle','off'), imshow(CGH_venus8KD_corr_real,[])
    colormap(jet)

    figure('Name','CGH_venus8KD_corr_img','NumberTitle','off'), imshow(CGH_venus8KD_corr_img,[])
    colormap(jet)