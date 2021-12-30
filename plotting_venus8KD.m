%% histogram venus8KD

hevc_real = mean(hevc_venus8KD_SNR_real)
jpeg_2000_real = mean(jpeg2000_venus8KD_SNR_real)
libaom_av1_real = mean(libaom_av1_venus8KD_SNR_real)

means_real = [hevc_real,jpeg_2000_real,libaom_av1_real]

hevc_imag = mean(hevc_venus8KD_SNR_imag)
jpeg_2000_imag = mean(jpeg2000_venus8KD_SNR_imag)
libaom_av1_imag = mean(libaom_av1_venus8KD_SNR_imag)

means_imag = [hevc_imag,jpeg_2000_imag,libaom_av1_imag]


data_real = means_real';
data_imag = means_imag';
    b=bar([data_real, data_imag]);

    ylabel('SNR [dB]')
    grid on;
    grid minor;
    set(gca,'XTickLabel',{'HEVC','JPEG 2000','libaom AV1'});
    legend('real', 'imag');
