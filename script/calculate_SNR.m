function [snr_values] = calculate_SNR(matrix, height, width, hologram_name, hologram_path, codec_path)

Y_Hol3D = cell(1,1);
U_Hol3D = cell(1,1);
V_Hol3D = cell(1,1);
U_Hol3D{1,1} = zeros(height/2, width/2);
V_Hol3D{1,1} = zeros(height/2, width/2);
Y_Hol3D{1,1} = matrix;
filename = strcat(hologram_path,'yuv/', hologram_name, '.yuv');
numfrm = 1;
yuv_export(Y_Hol3D,U_Hol3D,V_Hol3D,filename,numfrm);

q_values = [4 7 10 20 30 40 51];
snr_values = [];

for i = 1:1
    q = q_values(i);
    q = int2str(q);
    %metto le parentesi graffe prima di q perché altrimenti non mette lo
    %spazio infatti dopo devo chiamare encode_hevc_command{1} perché il
    %comando è diventato un cell array
    %(problema di runtime)
    encode_hevc_command = strcat('cd codec/HEVC && TAppEncoder.exe -c encoder_intra_main.cfg -i ../../', ...
    filename, ' -fr 1 -f 1 --SourceWidth=', int2str(width), ' --SourceHeight=', int2str(height), ...
    ' --InputChromaFormat=400 --Profile=main_444_intra -q', {' '}, q , ' --InputBitDepth=8 --OutputBitDepth=8 -o ../../', hologram_path,'yuv/output.yuv -b ../../', hologram_path,'bin/output.bin')

dos(encode_hevc_command{1});


[Y_Hol3D_decoded,U_Hol3D_decoded,V_Hol3D_decoded] = yuv_import('./codec/HEVC/output.yuv',[width height],1);

snr_values(i) = snr(matrix,Y_Hol3D_decoded{1,1});

%figure,imshow(Y_Hol3D_decoded{1,1}, [])
%figure,imshow(matrix, [])

end



