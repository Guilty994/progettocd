%% DEBUG HEVC
'START DEBUG HEVC'
% ----- START  
% check numbers of returned regen matrix and look up for overrided matrix 
% ------
if size(matrices_regen_hevc_real) ~= size(matrices_regen_hevc_imag)
    throw(MException('HEVC:regeneratedmatrices', 'Numbers of returned regenerated matrix doest match.'))
end
hevc_numbers_of_regen_matrix = size(matrices_regen_hevc_real);
for i = 1:hevc_numbers_of_regen_matrix(2)
    HEVC_THIS_MUST_NOT_BE_0_MATRIX = minus(matrices_regen_hevc_real{i}, matrices_regen_hevc_imag{i});
    if HEVC_THIS_MUST_NOT_BE_0_MATRIX ~= zeros(height, width)
        throw(MException('HEVC:regeneratedmatrices', 'real and imaginary matrix are equals.'))
    end
end
% ----- END  
% check numbers of returned regen matrix and look up for overrided matrix 
% ------
% -- end DEBUG HEVC --
'END DEBUG HEVC'