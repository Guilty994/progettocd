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
regen_matrices = cell(length(q_values)); % return values (matrices regenerated after encode and decode steps)

for i = 1:length(q_values)
    q = q_values(i); %i-th value acquisition
    q = int2str(q);  %integer to string conversion
    % converting command into cell array using curly braces:
    % no space issue if not using this method;
    % (runtime issue)
    encode_hevc_command = strcat('cd codec/HEVC && TAppEncoder.exe -c encoder_intra_main.cfg -i ../../', ...
    filename, ' -fr 1 -f 1 --SourceWidth=', int2str(width), ' --SourceHeight=', int2str(height), ...
    ' --InputChromaFormat=400 --Profile=main_444_intra -q', {' '}, q , ' --InputBitDepth=8 --OutputBitDepth=8 -o ../../', hologram_path,'yuv/reconstructed_yuv_hevc_',q,'_',matrix_type,'.yuv -b ../../', hologram_path,'bin/compressed_hevc_',q,'_',matrix_type,'.bin')

dos(encode_hevc_command{1});

% ~ = ignored value
[Y_Hol3D_decoded,~,~] = yuv_import(strcat(hologram_path, 'yuv/reconstructed_yuv_hevc_',q,'_',matrix_type,'.yuv'),[width height],1);

regen_matrices{i} = Y_Hol3D_decoded{1,1};

%figure,imshow(Y_Hol3D_decoded{1,1}, [])
%figure,imshow(matrix, [])

end



