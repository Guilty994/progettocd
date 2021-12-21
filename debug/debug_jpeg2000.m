%% DEBUG JPEG2000
'START DEBUG JPEG2000'
% ----- START  
% check numbers of returned regen matrix and look up for overrided matrix 
% ------
if size(matrices_regen_jpeg2000_real) ~= size(matrices_regen_jpeg2000_imag)
    throw(MException('JPEG200:regeneratedmatrices', 'Numbers of returned regenerated matrix doest match.'))
end
JPEG2000_numbers_of_regen_matrix = size(matrices_regen_jpeg2000_real);
for i = 1:JPEG2000_numbers_of_regen_matrix(2)
    JPEG2000_THIS_MUST_NOT_BE_0_MATRIX = minus(matrices_regen_jpeg2000_real{i}, matrices_regen_jpeg2000_imag{i});
    if JPEG2000_THIS_MUST_NOT_BE_0_MATRIX ~= zeros(height, width)
        throw(MException('JPEG200:regeneratedmatrices', 'real and imaginary matrix are equals.'))
    end
end
% ----- END  
% check numbers of returned regen matrix and look up for overrided matrix 
% ------
% -- END DEBUG JPEG2000 --

'END DEBUG JPEG2000'