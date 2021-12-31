%% histogram 3d multi

hevc_real = mean(hevc_multi3d_SNR_real)
jpeg_2000_real = mean(jpeg2000_multi3d_SNR_real)
libaom_av1_real = mean(libaom_av1_multi3d_SNR_real)
svt_av1_real = mean(svt_av1_multi3d_SNR_real)

means_real = [hevc_real,jpeg_2000_real,svt_av1_real,libaom_av1_real]

hevc_imag = mean(hevc_multi3d_SNR_imag)
jpeg_2000_imag = mean(jpeg2000_multi3d_SNR_imag)
libaom_av1_imag = mean(libaom_av1_multi3d_SNR_imag)
svt_av1_imag = mean(svt_av1_multi3d_SNR_imag)

means_imag = [hevc_imag,jpeg_2000_imag,svt_av1_imag,libaom_av1_imag]


data_real = means_real';
data_imag = means_imag';
    b=bar([data_real, data_imag]);

    ylabel('SNR [dB]')
    grid on;
    grid minor;
    set(gca,'XTickLabel',{'HEVC','JPEG 2000','SVT-AV1','libaom AV1'});
    legend('real', 'imag');



  %% basic plotting

  x_axis = [1 2 3 4 5 6 7];

  plot(x_axis, hevc_multi3d_SNR_real, '-|','MarkerSize',10,'LineWidth',2);
  hold on
  plot(x_axis, flip(jpeg2000_multi3d_SNR_real),'-|','MarkerSize',10,'LineWidth',2);
  hold on
  plot(x_axis, libaom_av1_multi3d_SNR_real, '-|','MarkerSize',10,'LineWidth',2);
  hold on
  plot(x_axis, svt_av1_multi3d_SNR_real, '-|','MarkerSize',10,'LineWidth',2);
  hold off
  grid on
  grid minor

  xlabel('q values')
  ylabel('SNR [dB]')

  legend('HEVC','JPEG 2000', 'libaom AV1','SVT-AV1')
  lgd = legend;
  lgd.FontWeight = 'bold'
