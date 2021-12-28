% real matrix and imaginary matrix rescaling %
% Probably we have to transform the matrix into an image
% instead of performing rescale
real_matrix_rescaled_255 = rescale(real_matrix,0,255);
imag_matrix_rescaled_255 = rescale(imag_matrix,0,255);
real_matrix_rescaled_0_1 = rescale(real_matrix,0,1);
imag_matrix_rescaled_0_1 = rescale(imag_matrix,0,1);

min_raw_complex_real = min(min(real_matrix));
max_raw_complex_real = max(max(real_matrix));

min_raw_complex_imag = min(min(imag_matrix));
max_raw_complex_imag = max(max(imag_matrix));