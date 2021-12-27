% parameters passed in the functions are in the workspace
%% libaom AV1
'libaom AV1 operations: START'
libaom_av1_real_matrices = encode_decode_AV1_libaom(real_matrix_rescaled_255, height, width, hologram_name, hologram_path, 'real');
libaom_av1_imag_matrices = encode_decode_AV1_libaom(imag_matrix_rescaled_255, height, width, hologram_name, hologram_path, 'imag');

    % SNR Calculation
    'libaom AV1 SNR calc: START'
    libaom_av1_SNRs_real = calculate_SNR(real_matrix_rescaled_255,libaom_av1_real_matrices);
    libaom_av1_SNRs_imag = calculate_SNR(imag_matrix_rescaled_255,libaom_av1_imag_matrices);
    'libaom AV1 SNR calc: END'

    % RENDERING BLOCK (for libaom AV1)
    'libaom AV1 hologram reconstruction: START'
    recontruction_libaom_AV1 = codec_regen(hologram_path, hologram_name,'libaom_AV1',libaom_av1_real_matrices, libaom_av1_imag_matrices, min_raw_complex_real, ...
        max_raw_complex_real, min_raw_complex_imag, max_raw_complex_imag, width, height, wlen, area, zrec);
    'libaom AV1 hologram reconstruction: END'

    % PSNR calc. for libaom AV1
    'libaom AV1 PSNR Calc: START'
    libaom_AV1_psnr = calculate_PSNR(reconstrution_vanilla,recontruction_libaom_AV1);
    'libaom AV1 PSNR Calc: END'
    'libaom AV1 operations: END'

    %% DEBUG LIBAOM_AV1

    if DEBUG == 1
        debug_libaom_av1
    end
    % -- end DEBUG LIBAOM_AV1 --