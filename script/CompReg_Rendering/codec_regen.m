%% COMPLEX REGENERATION and RENDERING BLOCK (for CODEC regenerated complex matrix)
% codec_real_matrices = real matrices obtained after
%                      compression/decompression step with CODEC
% codec_imag_matrices = imaginary matrices obtained after
%                      compression/decompression step with CODEC
% real_min = real original matrix minimum value used for re-map to original
%            ranges
% real_max = real original matrix maximum value used for re-map to original
%            ranges
% imag_min = imaginary original matrix minimum value used for re-map to original
%            ranges
% imag_max = imaginary original matrix maximum value used for re-map to original
%            ranges
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [reconstruction_CODEC] = codec_regen(hologram_path, hologram_name, codec_name, codec_real_matrices, codec_imag_matrices, ...
    real_min, real_max, imag_min, imag_max, width, height, wlen, area, zrec)

% setup
num_of_matrices = size(codec_real_matrices);
% pre-allocation
codec_real_regen = cell(num_of_matrices(1), num_of_matrices(2));
codec_imag_regen = cell(num_of_matrices(1), num_of_matrices(2));
codec_complex_regen = cell(num_of_matrices(1), num_of_matrices(2));
reconstruction_CODEC = cell(num_of_matrices(1), num_of_matrices(2));

strcat(codec_name,' decoded files reconstruction: START')
for i = 1: num_of_matrices(2)
    % re-map the components in their original ranges
    codec_real_regen{i} = rescale(codec_real_matrices{i},real_min, real_max);
    codec_imag_regen{i} = rescale(codec_imag_matrices{i},imag_min, imag_max);
    
    % combining the components into a single complex matrix
    codec_complex_regen{i} = complex(codec_real_regen{i}, codec_imag_regen{i});
    % Reconstruction using ASM
    % The i in the hologram name is added to differentiate files
    reconstruction_CODEC{i} = hologram_reconstruction(hologram_path,strcat(hologram_name,'_',codec_name,'_',string(i)), ...
        height, width, wlen, area, zrec, codec_complex_regen{i});
end % END for
strcat(codec_name,' decoded files reconstruction: END')
% -- END of COMPLEX REGENERATION and RENDERING BLOCK (for CODEC regenerated complex matrix) --