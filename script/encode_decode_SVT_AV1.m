function [regen_matrices] = encode_decode_SVT_AV1(matrix, height, width, hologram_name, hologram_path, matrix_type)

Y_Hol3D = cell(1,1);
U_Hol3D = cell(1,1);
V_Hol3D = cell(1,1);
U_Hol3D{1,1} = zeros(height/2, width/2);
V_Hol3D{1,1} = zeros(height/2, width/2);
Y_Hol3D{1,1} = matrix;
filename = strcat(hologram_path,'yuv/RAW_', hologram_name,'_',matrix_type, '.yuv');
numfrm = 1;
yuv_export(Y_Hol3D,U_Hol3D,V_Hol3D,filename,numfrm);

q_values = [5 9 12 25 37 49 63];
regen_matrices = {};

for i = 1:length(q_values)
    q = q_values(i);
    q = int2str(q);
    % converting command into cell array using curly braces:
    % no space issue if not using this method;
    % (runtime issue)
    encode_av1_command = strcat('cd codec/SVT-AV1 && SvtAv1EncApp.exe -i ../../', ...
    filename, ' -w', {' '}, int2str(width), ' -h', {' '}, int2str(height), ...
    ' -n 1 --fps 1 --enable-stat-report 1 -q', {' '}, q , ' -o ../../', hologram_path,'yuv/output_svt_av1_',q,'_',matrix_type,'.yuv -b ../../', hologram_path,'bin/output_svt_av1_',q,'_',matrix_type,'.bin')

dos(encode_av1_command{1});

% ~ = ignored value
[Y_Hol3D_decoded,~,~] = yuv_import(strcat(hologram_path, 'yuv/output_svt_av1_',q,'_',matrix_type,'.yuv'),[width height],1);

regen_matrices{i} = Y_Hol3D_decoded{1,1};

%figure,imshow(Y_Hol3D_decoded{1,1}, [])
%figure,imshow(matrix, [])

end



