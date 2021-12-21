function[regen_matrices] =  encode_decode_JPEG2000(matrix, hologram_name, hologram_path, matrix_type)
regen_matrices = {};    
%conversione matrice in .pgm
imwrite(matrix,strcat(hologram_path, hologram_name,'_',matrix_type,'.pgm'));

%compression of .pgm file using kdu_compress
back_to_root = '../../../../';
bit_rates = [10 20 30 40 50 60 70 80 90];
j2c_generated = strings(length(bit_rates));
pgm_generated = strings(length(bit_rates));
for i = 1:length(bit_rates)
    j2c_generated(i) = strcat(hologram_name,'_',string(bit_rates(i)),'.j2c'); 
    encode_jpeg_command = strcat('cd codec/JPEG2000/lib/kakadu && kdu_compress -i ', ...
        {' '},back_to_root, hologram_path, hologram_name,'_',matrix_type, ...
        '.pgm -o ',{' '}, back_to_root, hologram_path, hologram_name,'_',string(bit_rates(i)),'_',matrix_type,'.j2c',{' '}, ...
        'Cycc=no -precise Qfactor=', string(bit_rates(i)))
    dos(encode_jpeg_command{1});
end

%decompression of .j2c file using kdu_expand
for i = 1:length(bit_rates)
    pgm_generated(i) = strcat(hologram_name,'_',string(bit_rates(i)),'_',matrix_type,'_decoded.pgm');
    decode_jepeg_command = strcat('cd codec/JPEG2000/lib/kakadu && kdu_expand -i', ...
        {' '},back_to_root, hologram_path, hologram_name,'_',string(bit_rates(i)),'_',matrix_type,'.j2c',{' '}, ...
        ' -o', {' '},back_to_root, hologram_path, pgm_generated(i))
    dos(decode_jepeg_command{1});
end

%conversion from .pgm to raw matrix
%rescaled_start_matrix_uint8 = imread(strcat(hologram_path, hologram_name,'_',matrix_type,'.pgm'));
%rescaled_start_matrix = im2single(rescaled_start_matrix_uint8);   
for i = 1:length(bit_rates)
    matrix_regen_uint8 = imread(strcat(hologram_path, pgm_generated(i)));
    regen_matrices{i} = single(matrix_regen_uint8);
    %save(strcat(hologram_path, pgm_generated(i), '.mat'), 'matrix_regen');
    %snr_values(i) = snr(rescale(matrix, 0, max(max(matrix_regen))), matrix_regen);
    %snr_values(i) = snr(rescaled_start_matrix, minus(rescaled_start_matrix,matrix_regen));
end
%snr evaluation





