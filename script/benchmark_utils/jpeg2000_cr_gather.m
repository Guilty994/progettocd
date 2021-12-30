function [jpeg2000_sizes] = jpeg2000_cr_gather(sample_path, matrix_comp, file_name)

q_values = [30 40 50 60 70 80 90];

for i=1:length(q_values)
    file_info=dir(strcat(sample_path,'\j2c\',file_name,'_',string(q_values(i)),'_',matrix_comp,'.j2c'));
    jpeg2000_sizes(i)=file_info.bytes;
end
