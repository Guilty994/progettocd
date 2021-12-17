function [snr_values] = calculate_SNR_AV1_libaom(matrix, height, width, hologram_name, hologram_path)


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

for i = 1:1
    q = q_values(i);
    q = int2str(q);

    encode_av1_command = strcat('cd codec/AV1_libaom && aomenc --codec=av1 -p 1 --cpu-used=6 --threads=16',  {' '}, ...
        '-w', {' '}, string(width), {' '}, '-h', {' '}, string(height),{' '}, '--i420 --end-usage=q --cq-level=5 --min-q=0 --max-q=5 --profile=0', ...
        {' '},'-o ../../', hologram_path, 'yuv/output_libaom_av1_compressed.yuv',{' '},'../../', filename);

dos(encode_av1_command{1});
    
    decode_av1_command = strcat('cd codec/AV1_libaom && aomdec -o',{' '},'../../',hologram_path, 'yuv/output_libaom_av1_reconstructed.yuv',{' '},'../../', hologram_path, 'yuv/output_libaom_av1_compressed.yuv');

dos(decode_av1_command{1});
    
[Y_Hol3D_decoded,U_Hol3D_decoded,V_Hol3D_decoded] = yuv_import(strcat(hologram_path, 'yuv/output_libaom_av1_reconstructed.yuv'),[width height],1);

snr_values(i) = snr(matrix,Y_Hol3D_decoded{1,1});

%figure,imshow(Y_Hol3D_decoded{1,1}, [])
%figure,imshow(matrix, [])

end

