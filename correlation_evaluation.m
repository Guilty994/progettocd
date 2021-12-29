% Load all datasets

% Interfere 1
    %% Hol_3D_cat.mat
    'Loading... Hol_3D_cat.mat'
    addpath('./script/');
    addpath('./dataset/Interfere1/3D_Cat/');
    load('Hol_3D_cat.mat'); 
    'Loading completed.'
    [Hol_3D_cat_real_matrix, Hol_3D_cat_imag_matrix] = split_complex(Hol);

    %Mean
    mean_Hol_3D_cat_real_matrix = mean(mean(rescale(Hol_3D_cat_real_matrix,0,255)));
    mean_Hol_3D_cat_imag_matrix = mean(mean(rescale(Hol_3D_cat_imag_matrix,0,255)));

    %Variance 
    var_Hol_3D_cat_real_matrix = mean(var(rescale(Hol_3D_cat_real_matrix,0,255)));
    var_Hol_3D_cat_imag_matrix = mean(var(rescale(Hol_3D_cat_imag_matrix,0,255)));

    %Pearson correlation 
    
    COLUMNS_Hol_3D_cat_corr_real = corrcoef(Hol_3D_cat_real_matrix);
    COLUMNS_Hol_3D_cat_corr_img = corrcoef(Hol_3D_cat_imag_matrix);

    ROW_Hol_3D_cat_corr_real = corrcoef(transpose(Hol_3D_cat_real_matrix));
    ROW_Hol_3D_cat_corr_img = corrcoef(transpose(Hol_3D_cat_imag_matrix));


    figure('Name','COLUMNS_Hol_3D_cat_corr_real','NumberTitle','off'), imshow(COLUMNS_Hol_3D_cat_corr_real,[])
    colormap(jet)

    figure('Name','COLUMNS_Hol_3D_cat_corr_img','NumberTitle','off'), imshow(COLUMNS_Hol_3D_cat_corr_img,[])
    colormap(jet)

    figure('Name','ROW_Hol_3D_cat_corr_real','NumberTitle','off'), imshow(ROW_Hol_3D_cat_corr_real,[])
    colormap(jet)

    figure('Name','ROW_Hol_3D_cat_corr_img','NumberTitle','off'), imshow(ROW_Hol_3D_cat_corr_img,[])
    colormap(jet)

    
    %% Hol_3D_multi.mat
    'Loading... Hol_3D_multi.mat'
    addpath('./script/');
    addpath('./dataset/Interfere1/3D_Multi/');
    load('Hol_3D_multi.mat'); 
    'Loading completed.'
    [Hol_3D_multi_real_matrix, Hol_3D_multi_imag_matrix] = split_complex(Hol);

    %Mean
    mean_Hol_3D_multi_real_matrix = mean(mean(rescale(Hol_3D_multi_real_matrix, 0, 255)));
    mean_Hol_3D_multi_imag_matrix = mean(mean(rescale(Hol_3D_multi_imag_matrix, 0, 255)));

    %Variance 
    var_Hol_3D_multi_real_matrix = mean(var(rescale(Hol_3D_multi_real_matrix, 0, 255)));
    var_Hol_3D_multi_imag_matrix = mean(var(rescale(Hol_3D_multi_imag_matrix, 0, 255)));

    %Pearson correlation 

    COLUMNS_Hol_3D_multi_corr_real = corrcoef(Hol_3D_multi_real_matrix);
    COLUMNS_Hol_3D_multi_corr_img = corrcoef(Hol_3D_multi_imag_matrix);

    ROW_Hol_3D_multi_corr_real = corrcoef(transpose(Hol_3D_multi_real_matrix));
    ROW_Hol_3D_multi_corr_img = corrcoef(transpose(Hol_3D_multi_imag_matrix));

    figure('Name','COLUMNS_Hol_3D_multi_corr_real','NumberTitle','off'), imshow(COLUMNS_Hol_3D_multi_corr_real,[])
    colormap(jet)

    figure('Name','COLUMNS_Hol_3D_multi_corr_img','NumberTitle','off'), imshow(COLUMNS_Hol_3D_multi_corr_img,[])
    colormap(jet)

    figure('Name','ROW_Hol_3D_multi_corr_real','NumberTitle','off'), imshow(ROW_Hol_3D_multi_corr_real,[])
    colormap(jet)

    figure('Name','ROW_Hol_3D_multi_corr_img','NumberTitle','off'), imshow(ROW_Hol_3D_multi_corr_img,[])
    colormap(jet)

    %% Hol_3D_cat.mat
    'Loading... Hol_3D_cat.mat'
    addpath('./script/');
    addpath('./dataset/Interfere1/3D_Venus/');
    load('Hol_3D_venus.mat'); 
    'Loading completed.'

    [Hol_3D_venus_real_matrix, Hol_3D_venus_imag_matrix] = split_complex(Hol);

    %Mean
    mean_Hol_3D_venus_real_matrix = mean(mean(rescale(Hol_3D_venus_real_matrix, 0, 255)));
    mean_Hol_3D_venus_imag_matrix = mean(mean(rescale(Hol_3D_venus_imag_matrix, 0, 255)));

    %Variance 
    var_Hol_3D_venus_real_matrix = mean(var(rescale(Hol_3D_venus_real_matrix, 0, 255)));
    var_Hol_3D_venus_imag_matrix = mean(var(rescale(Hol_3D_venus_imag_matrix, 0, 255)));

    %Pearson correlation 
    
    COLUMNS_Hol_3D_venus_corr_real = corrcoef(Hol_3D_venus_real_matrix);
    COLUMNS_Hol_3D_venus_corr_img = corrcoef(Hol_3D_venus_imag_matrix);

    ROW_Hol_3D_venus_corr_real = corrcoef(transpose(Hol_3D_venus_real_matrix));
    ROW_Hol_3D_venus_corr_img = corrcoef(transpose(Hol_3D_venus_imag_matrix));

    figure('Name','COLUMNS_Hol_3D_venus_corr_real','NumberTitle','off'), imshow(COLUMNS_Hol_3D_venus_corr_real,[])
    colormap(jet)

    figure('Name','COLUMNS_Hol_3D_venus_corr_img','NumberTitle','off'), imshow(COLUMNS_Hol_3D_venus_corr_img,[])
    colormap(jet)

    figure('Name','ROW_Hol_3D_venus_corr_real','NumberTitle','off'), imshow(ROW_Hol_3D_venus_corr_real,[])
    colormap(jet)

    figure('Name','ROW_Hol_3D_venus_corr_img','NumberTitle','off'), imshow(ROW_Hol_3D_venus_corr_img,[])
    colormap(jet)

% Interfere 2

    %% CGH_cat8KD.mat
    'Loading... CGH_cat8KD.mat'
    addpath('./script/');
    addpath('./dataset/Interfere2/cat8KD/');
    load('CGH_cat8KD.mat');
    'Loading completed.'

    [CGH_cat8KD_real_matrix, CGH_cat8KD_imag_matrix] = split_complex(CGH.Hol);

    %Mean
    mean_CGH_cat8KD_real_matrix = mean(mean(rescale(CGH_cat8KD_real_matrix, 0, 255)));
    mean_CGH_cat8KD_imag_matrix = mean(mean(rescale(CGH_cat8KD_imag_matrix, 0, 255)));

    %Variance 
    var_CGH_cat8KD_real_matrix = mean(var(rescale(CGH_cat8KD_real_matrix, 0, 255)));
    var_CGH_cat8KD_imag_matrix = mean(var(rescale(CGH_cat8KD_imag_matrix, 0, 255)));

    %Pearson correlation 

    COLUMNS_CGH_cat8KD_corr_real = corrcoef(CGH_cat8KD_real_matrix);
    COLUMNS_CGH_cat8KD_corr_img = corrcoef(CGH_cat8KD_imag_matrix);

    ROW_cat8KD_corr_real = corrcoef(transpose(CGH_cat8KD_real_matrix));
    ROW_CGH_cat8KD_corr_img = corrcoef(transpose(CGH_cat8KD_imag_matrix));

    figure('Name','COLUMNS_CGH_cat8KD_corr_real','NumberTitle','off'), imshow(COLUMNS_CGH_cat8KD_corr_real,[])
    colormap(jet)

    figure('Name','COLUMNS_CGH_cat8KD_corr_img','NumberTitle','off'), imshow(COLUMNS_CGH_cat8KD_corr_img,[])
    colormap(jet)

    figure('Name','ROW_cat8KD_corr_real','NumberTitle','off'), imshow(ROW_cat8KD_corr_real,[])
    colormap(jet)

    figure('Name','ROW_CGH_cat8KD_corr_img','NumberTitle','off'), imshow(ROW_CGH_cat8KD_corr_img,[])
    colormap(jet)

    %% CGH_cat8KD.mat
    'Loading... CGH_venus8KD.mat'
    addpath('./script/');
    addpath('./dataset/Interfere2/venus8KD/');
    load('CGH_venus8KD.mat');
    'Loading completed.'

    [CGH_venus8KD_real_matrix, CGH_venus8KD_imag_matrix] = split_complex(CGH.Hol);

    %Mean
    mean_CGH_venus8KD_real_matrix = mean(mean(rescale(CGH_venus8KD_real_matrix, 0, 255)));
    mean_CGH_venus8KD_imag_matrix = mean(mean(rescale(CGH_venus8KD_imag_matrix, 0, 255)));

    %Variance 
    var_CGH_venus8KD_real_matrix = mean(var(rescale(CGH_venus8KD_real_matrix, 0, 255)));
    var_CGH_venus8KD_imag_matrix = mean(var(rescale(CGH_venus8KD_imag_matrix, 0, 255)));

    %Pearson correlation 

    COLUMNS_CGH_venus8KD_corr_real = corrcoef(CGH_venus8KD_real_matrix);
    COLUMNS_CGH_venus8KD_corr_img = corrcoef(CGH_venus8KD_imag_matrix);

    ROW_CGH_venus8KD_corr_real = corrcoef(transpose(CGH_venus8KD_real_matrix));
    ROW_CGH_venus8KD_corr_img = corrcoef(transpose(CGH_venus8KD_imag_matrix));

    figure('Name','COLUMNS_CGH_venus8KD_corr_real','NumberTitle','off'), imshow(COLUMNS_CGH_venus8KD_corr_real,[])
    colormap(jet)

    figure('Name','COLUMNS_CGH_venus8KD_corr_img','NumberTitle','off'), imshow(COLUMNS_CGH_venus8KD_corr_img,[])
    colormap(jet)

    figure('Name','ROW_CGH_venus8KD_corr_real','NumberTitle','off'), imshow(ROW_CGH_venus8KD_corr_real,[])
    colormap(jet)

    figure('Name','ROW_CGH_venus8KD_corr_img','NumberTitle','off'), imshow(ROW_CGH_venus8KD_corr_img,[])
    colormap(jet)