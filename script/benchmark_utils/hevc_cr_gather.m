function [hevc_sizes] = hevc_cr_gather(sample_path, matrix_comp)

q_values = [4 7 10 20 30 40 51];

for i=1:length(q_values)
    file_info=dir(strcat(sample_path,'\bin\compressed_hevc_',string(q_values(i)),'_',matrix_comp,'.bin'));
    hevc_sizes(i)=file_info.bytes;
end
