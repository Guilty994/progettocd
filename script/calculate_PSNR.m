function[psnr_values] = calculate_PSNR(base_matrix,encoded_matrices)

psnr_values = [];

for i = 1:length(encoded_matrices)
    psnr_values(i,1) = psnr(encoded_matrices{i}, base_matrix);  
end

