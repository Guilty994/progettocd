%% DEBUG LIBAOM-AV1
'START DEBUG LIBAOM-AV1'
% ----- START  
% check numbers of returned regen matrix and look up for overrided matrix 
% ------
if size(matrices_regen_libaom_av1_real) ~= size(matrices_regen_libaom_av1_imag)
    throw(MException('LIBAOMAV1:regeneratedmatrices', 'Numbers of returned regenerated matrix doest match.'))
end
LIBAOM_AV1_numbers_of_regen_matrix = size(matrices_regen_libaom_av1_real);
for i = 1:LIBAOM_AV1_numbers_of_regen_matrix(2)
    LIBAOM_AV1_THIS_MUST_NOT_BE_0_MATRIX = minus(matrices_regen_libaom_av1_real{i}, matrices_regen_libaom_av1_imag{i});
    if LIBAOM_AV1_THIS_MUST_NOT_BE_0_MATRIX ~= zeros(height, width)
        throw(MException('LIBAOMAV1:regeneratedmatrices', 'Real and imaginary matrix are equals.'))
    end
end
% ----- END  
% check numbers of returned regen matrix and look up for overrided matrix 
% ------

% ----- START
% matrix intermatching check
% -----

for i = 1:LIBAOM_AV1_numbers_of_regen_matrix(2)
    for j = i+1:LIBAOM_AV1_numbers_of_regen_matrix(2)
        if matrices_regen_libaom_av1_real{i} == matrices_regen_libaom_av1_real{j}
             throw(MException('LIBAOMAV1:intermatchingcheck', 'Spotted 2 equal real matrix.'))
        end
         if matrices_regen_libaom_av1_imag{i} == matrices_regen_libaom_av1_imag{j}
            throw(MException('LIBAOMAV1:intermatchingcheck', 'Spotted 2 equal imag matrix.'))
        end
    end
end

for i = 1:LIBAOM_AV1_numbers_of_regen_matrix(2)
    for j = 1:LIBAOM_AV1_numbers_of_regen_matrix(2)
        if matrices_regen_libaom_av1_real{i} == matrices_regen_libaom_av1_imag{j}
            throw(MException('LIBAOMAV1:intermatchingcheck', 'Spotted 2 equal real and imag matrix.'))
        end
    end
end



% ----- END
% matrix intermatching check
% -----

% -- END DEBUG LIBAOM-AV1 --

'END DEBUG LIBAOM-AV1'