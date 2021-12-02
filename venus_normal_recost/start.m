load('Hol_3D_venus.mat');%load hologram matrix

%% Generation of the hologram trough ASM
generate_bin;

%% Reconstruction using ASM
b_reconstruction_of_hologram_plane_wave;

%% Generation of YUV file
hologram_range255 = rescale(hologram,0, 255);
Y_Hol3D = cell(1,1);
U_Hol3D = cell(1,1);
V_Hol3D = cell(1,1);
U_Hol3D{1,1} = zeros(540, 960);
V_Hol3D{1,1} = zeros(540, 960);
Y_Hol3D{1,1} = hologram_range255;
filename = 'yuv/HOL_3D_venus.yuv';
numfrm = 1;
yuv_export(Y_Hol3D,U_Hol3D,V_Hol3D,filename,numfrm);


