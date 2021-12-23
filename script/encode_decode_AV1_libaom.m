function [regen_matrices] = encode_decode_AV1_libaom(matrix, height, width, hologram_name, hologram_path, matrix_type)

Y_Hol3D = cell(1,1);
U_Hol3D = cell(1,1);
V_Hol3D = cell(1,1);
U_Hol3D{1,1} = zeros(height/2, width/2);
V_Hol3D{1,1} = zeros(height/2, width/2);
Y_Hol3D{1,1} = matrix;
filename = strcat(hologram_path,'yuv/RAW_', hologram_name,'_',matrix_type, '.yuv');
filename_y4m = strcat(hologram_path,'yuv/RAW_', hologram_name,'_',matrix_type, '.y4m');
numfrm = 1;
yuv_export(Y_Hol3D,U_Hol3D,V_Hol3D,filename,numfrm);

q_values = [5 9 12 25 37 49 63];

regen_matrices = {}; % return values (matrices regenerated after encode and decode steps)
'ffmpeg conversion'
    y4m_conver_command = strcat('cd codec/ffmpeg && ffmpeg -s',{' '},string(width),'x',string(height),' -r',{' '},string(numfrm), ...
        {' '},'-pix_fmt yuv420p -i',{' '},'../../',filename,{' '},'../../',filename_y4m)
    dos(y4m_conver_command{1});
'END ffmpeg conversion'
for i = 1:length(q_values)
    q = q_values(i);
    q = int2str(q);
   
    'Av1 libaom encoding...'
    encode_av1_command = strcat('cd codec/AV1_libaom && aomenc --codec=av1 -p 1 --cpu-used=6 --threads=16', {' '}, ...
        '-w', {' '}, string(width), {' '}, '-h', {' '}, string(height),{' '}, '--i444 --end-usage=q --cq-level=',q,{' '},'--min-q=0 --max-q=63 --profile=0', ...
        {' '},'--webm -o ../../', hologram_path, 'yuv/output_libaom_av1_',q,'_',matrix_type,'_compressed.webm',{' '},'../../', filename_y4m);

    dos(encode_av1_command{1});
    
    decode_av1_command = strcat('cd codec/AV1_libaom && aomdec -o',{' '},'../../',hologram_path, 'yuv/output_libaom_av1_',q,'_',matrix_type,'_decompressed.yuv', ...
        {' '},'../../', hologram_path, 'yuv/output_libaom_av1_',q,'_',matrix_type,'_compressed.webm');

    dos(decode_av1_command{1});

% ~ = ingnored value
[Y_Hol3D_decoded,~,~] = yuv_import(strcat(hologram_path, 'yuv/output_libaom_av1_',q,'_',matrix_type,'_decompressed.yuv'),[width height],numfrm);

regen_matrices{i} = Y_Hol3D_decoded{1,1};

%figure,imshow(Y_Hol3D_decoded{1,1}, [])
%figure,imshow(matrix, [])

end

