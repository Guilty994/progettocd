function [svt_sizes] = svt_cr_gather(sample_path, matrix_comp)

q_values = [5 9 12 25 37 49 63];

for i=1:length(q_values)
    file_info=dir(strcat(sample_path,'\bin\output_svt_av1_',string(q_values(i)),'_',matrix_comp,'.bin'));
    svt_sizes(i)=file_info.bytes;
end
