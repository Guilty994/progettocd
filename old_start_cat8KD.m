addpath('./script');        %script directory
addpath('./script/TF');     %Fourier script directory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cat8kd = './dataset/cat8KD/';
addpath(cat8kd);
load('CGH_cat8KD.mat'); %load hologram matrix

height = 8192;
width = 8192;
%% Generation of the hologram trough ASM
filename = 'cat8kd_hologram';
hologram = generate_bin(cat8kd,filename,CGH.Hol, height, width, CGH.setup.wlen, 0.1, CGH.zrec);

%% Reconstruction using ASM

hologram_reconstruction(cat8kd,filename, height, width, CGH.setup.wlen, 0.1);

%% Generation of YUV file
hologram_range255 = rescale(hologram,0, 255);
Y_Hol3D = cell(1,1);
U_Hol3D = cell(1,1);
V_Hol3D = cell(1,1);
U_Hol3D{1,1} = zeros(height/2, width/2);
V_Hol3D{1,1} = zeros(height/2, width/2);
Y_Hol3D{1,1} = hologram_range255;
filename = strcat(cat8kd,'yuv/HOL_cat8kd.yuv');
numfrm = 1;
yuv_export(Y_Hol3D,U_Hol3D,V_Hol3D,filename,numfrm);

%% Calculate correlation
%calculate_correlation;


