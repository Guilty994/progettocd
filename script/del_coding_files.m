% parameters passed in the functions are in the workspace
%% File cleaning
bin_dir = strcat(hologram_path, 'bin/*');
j2c_dir = strcat(hologram_path, 'j2c/*');
jpeg_dir = strcat(hologram_path, 'jpeg/*');
pgm_dir = strcat(hologram_path, 'pgm/*');
yuv_dir = strcat(hologram_path, 'yuv/*');

directories = {bin_dir, j2c_dir, jpeg_dir, pgm_dir, yuv_dir};
num_dir = size(directories);

for i = 1:num_dir(2)
    % replacing '/' with '\'
    directories{i} = strrep(directories{i}, '/', '\');
    command = strcat('erase /Q',{' '},directories{i});
    dos(command{1})
end