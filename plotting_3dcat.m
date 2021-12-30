%% histogram 3d cat

hevc_real = mean(CR_3d_cat_hevc_real)
jpeg_2000_real = mean(CR_3d_cat_jpeg2000_real)
libaom_av1_real = mean(CR_3d_cat_libaom_real)

means_real = [hevc_real,jpeg_2000_real,libaom_av1_real]

hevc_imag = mean(CR_3d_cat_hevc_imag)
jpeg_2000_imag = mean(CR_3d_cat_jpeg2000_imag)
libaom_av1_imag = mean(CR_3d_cat_libaom_imag)

means_imag = [hevc_imag,jpeg_2000_imag,libaom_av1_imag]


data_real = means_real';
data_imag = means_imag';
    b=bar([data_real, data_imag]);

    ylabel('SNR [dB]')
    grid on;
    grid minor;
    set(gca,'XTickLabel',{'HEVC','JPEG 2000','libaom AV1'});
    legend('real', 'imag');
