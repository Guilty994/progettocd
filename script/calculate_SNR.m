function[snr_values] = calculate_SNR(base_matrix,encoded_matrices)

snr_values = [];

for i = 1:length(encoded_matrices)
    snr_values(i) = snr(base_matrix, minus(base_matrix,encoded_matrices{i}));  
end

