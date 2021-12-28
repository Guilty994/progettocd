%% FUNCTION complex_regeneration_rendering
% hologram_path = where the hologram data is stored
% hologram_name = name of the hologram
% width = hologram width in pixel
% height = hologram height in pixel
% wlen = wavelenght
% area = ???
% zrec = recontruction distance
% original_matrix = complex matrix representing the hologram

function [reconstruction_vanilla] = vanilla_regen(hologram_path, hologram_name, width, height, wlen, area, zrec, original_matrix)
    % RENDERING BLOCK (for raw complex matrix)
    % Regenerated vanilla hologram (step 4)
    %hologram_vanilla = 
    % The returnn value is unused
    %generate_bin(hologram_path, strcat(hologram_name,'_vanilla'),original_matrix,height, width, wlen, area, zrec);
    'START RENDERING BLOCK (for raw complex matrix)'
    reconstruction_vanilla = hologram_reconstruction(hologram_path,strcat(hologram_name,'_vanilla'), height, width, wlen, area, zrec, original_matrix);
    'END RENDERING BLOCK (for raw complex matrix)'
    % -- END of RENDERING BLOCK (for raw complex matrix) --