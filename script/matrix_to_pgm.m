function [pgm] = matrix_to_pgm(matrix, path, filename)
imwrite(matrix,strcat(path, filename,'.pgm'));