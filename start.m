addpath('./script');        %script directory
addpath('./script/TF');     %Fourier script directory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
venus = './dataset/venus/';
addpath(venus);
load('Hol_3D_venus.mat'); %load hologram matrix

%% Generation of the hologram trough ASM
filename = 'venus_hologram';
hologram = generate_bin(venus,filename,Hol);

%% Reconstruction using ASM
hologram_reconstruction(venus,filename);

%% Generation of YUV file
hologram_range255 = rescale(hologram,0, 255);
Y_Hol3D = cell(1,1);
U_Hol3D = cell(1,1);
V_Hol3D = cell(1,1);
U_Hol3D{1,1} = zeros(540, 960);
V_Hol3D{1,1} = zeros(540, 960);
Y_Hol3D{1,1} = hologram_range255;
filename = strcat(venus,'yuv/HOL_3D_venus.yuv');
numfrm = 1;
yuv_export(Y_Hol3D,U_Hol3D,V_Hol3D,filename,numfrm);

%% Calculate correlation
calculate_correlation;


