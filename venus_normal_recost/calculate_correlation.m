real = real(Hol);
imag = imag(Hol);

correlation_real = corrcoef(real);
correlation_imag = corrcoef(imag);

figure,imshow(correlation_real,[]);
figure,imshow(correlation_imag,[]);

