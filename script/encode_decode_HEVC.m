function [regen_matrices] = encode_decode_HEVC(matrix, height, width, hologram_name, hologram_path, matrix_type)

Y_Hol3D = cell(1,1);
U_Hol3D = cell(1,1);
V_Hol3D = cell(1,1);
U_Hol3D{1,1} = zeros(height/2, width/2);
V_Hol3D{1,1} = zeros(height/2, width/2);
Y_Hol3D{1,1} = matrix;
filename = strcat(hologram_path,'yuv/RAW_', hologram_name,'_',matrix_type, '.yuv');
numfrm = 1;
yuv_export(Y_Hol3D,U_Hol3D,V_Hol3D,filename,numfrm);

q_values = [4 7 10 20 30 40 51];
regen_matrices = {}; % return values (matrices regenerated after encode and decode steps)

for i = 1:1
    q = q_values(i); %i-th value acquisition
    q = int2str(q);  %integer to string conversion
    %metto le parentesi graffe prima di q perché altrimenti non mette lo
    %spazio infatti dopo devo chiamare encode_hevc_command{1} perché il
    %comando è diventato un cell array
    %(problema di runtime)
    encode_hevc_command = strcat('cd codec/HEVC && TAppEncoder.exe -c encoder_intra_main.cfg -i ../../', ...
    filename, ' -fr 1 -f 1 --SourceWidth=', int2str(width), ' --SourceHeight=', int2str(height), ...
    ' --InputChromaFormat=400 --Profile=main_444_intra -q', {' '}, q , ' --InputBitDepth=8 --OutputBitDepth=8 -o ../../', hologram_path,'yuv/output_hevc_',matrix_type,'.yuv -b ../../', hologram_path,'bin/output_hevc.bin')

dos(encode_hevc_command{1});

% ~ = ingnored value
[Y_Hol3D_decoded,~,~] = yuv_import(strcat(hologram_path, 'yuv/output_hevc_',matrix_type,'.yuv'),[width height],1);% qua stava il problema

regen_matrices{i} = Y_Hol3D_decoded{1,1};

%figure,imshow(Y_Hol3D_decoded{1,1}, [])
%figure,imshow(matrix, [])

end



