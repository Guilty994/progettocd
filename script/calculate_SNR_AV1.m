function [snr_values] = calculate_SNR_AV1(matrix, height, width, hologram_name, hologram_path)

Y_Hol3D = cell(1,1);
U_Hol3D = cell(1,1);
V_Hol3D = cell(1,1);
U_Hol3D{1,1} = zeros(height/2, width/2);
V_Hol3D{1,1} = zeros(height/2, width/2);
Y_Hol3D{1,1} = matrix;
filename = strcat(hologram_path,'yuv/', hologram_name, '.yuv');
numfrm = 1;
yuv_export(Y_Hol3D,U_Hol3D,V_Hol3D,filename,numfrm);

q_values = [5 9 12 25 37 49 63];
snr_values = [];

for i = 1:length(q_values)
    q = q_values(i);
    q = int2str(q);
    %metto le parentesi graffe prima di q perché altrimenti non mette lo
    %spazio infatti dopo devo chiamare encode_av1_command{1} perché il
    %comando è diventato un cell array
    %(problema di runtime)
    encode_av1_command = strcat('cd codec/SVT-AV1 && SvtAv1EncApp.exe -i ../../', ...
    filename, ' -w', {' '}, int2str(width), ' -h', {' '}, int2str(height), ...
    ' -n 1 --fps 1 --enable-stat-report 1 -q', {' '}, q , ' -o ../../', hologram_path,'yuv/output_av1.yuv -b ../../', hologram_path,'bin/output_av1.bin')

dos(encode_av1_command{1});


[Y_Hol3D_decoded,U_Hol3D_decoded,V_Hol3D_decoded] = yuv_import(strcat(hologram_path, 'yuv/output_av1.yuv'),[width height],1);

snr_values(i) = snr(matrix,Y_Hol3D_decoded{1,1});

%figure,imshow(Y_Hol3D_decoded{1,1}, [])
%figure,imshow(matrix, [])

end



