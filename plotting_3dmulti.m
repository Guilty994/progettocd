%% histogram 3d multi

hevc_real = mean(CR_3d_multi_hevc_real)
jpeg_2000_real = mean(CR_3d_multi_jpeg2000_real)
libaom_av1_real = mean(CR_3d_multi_libaom_real)
svt_av1_real = mean(CR_3d_multi_svt_real)

means_real = [hevc_real,jpeg_2000_real,libaom_av1_real,svt_av1_real]

hevc_imag = mean(CR_3d_multi_hevc_imag)
jpeg_2000_imag = mean(CR_3d_multi_jpeg2000_imag)
libaom_av1_imag = mean(CR_3d_multi_libaom_imag)
svt_av1_imag = mean(CR_3d_multi_svt_imag)

means_imag = [hevc_imag,jpeg_2000_imag,libaom_av1_imag,svt_av1_imag]


data_real = means_real';
data_imag = means_imag';
    b=bar([data_real, data_imag]);

    ylabel('SNR [dB]')
    grid on;
    grid minor;
    set(gca,'XTickLabel',{'HEVC','JPEG 2000','libaom AV1','SVT-AV1'});
    legend('real', 'imag');
