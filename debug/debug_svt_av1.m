%% DEBUG SVT-AV1
'START DEBUG SVT-AV1'
% ----- START  
% check numbers of returned regen matrix and look up for overrided matrix 
% ------
if size(matrices_regen_svt_av1_real) ~= size(matrices_regen_svt_av1_imag)
    throw(MException('SVT-AV1:regeneratedmatrices', 'Numbers of returned regenerated matrix doest match.'))
end
SVT_AV1_numbers_of_regen_matrix = size(matrices_regen_svt_av1_real);
for i = 1:SVT_AV1_numbers_of_regen_matrix(2)
    SVT_AV1_THIS_MUST_NOT_BE_0_MATRIX = minus(matrices_regen_svt_av1_real{i}, matrices_regen_svt_av1_imag{i});
    if SVT_AV1_THIS_MUST_NOT_BE_0_MATRIX ~= zeros(height, width)
        throw(MException('SVT-AV1:regeneratedmatrices', 'real and imaginary matrix are equals.'))
    end
end
% ----- END  
% check numbers of returned regen matrix and look up for overrided matrix 
% ------

% -- END DEBUG SVT-AV1 --

'END DEBUG SVT-AV1'