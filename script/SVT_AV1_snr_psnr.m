% parameters passed in the functions are in the workspace
%% SVT-AV1
'SVT-AV1 operations: START'
svt_av1_real_matrices = encode_decode_SVT_AV1(real_matrix_rescaled_255, height, width, hologram_name, hologram_path, 'real');
svt_av1_imag_matrices = encode_decode_SVT_AV1(imag_matrix_rescaled_255, height, width, hologram_name, hologram_path, 'imag');

    % SNR calculation
    'SVT-AV1 SNR calc: START'
    svt_av1_SNRs_real = calculate_SNR(real_matrix_rescaled_255,svt_av1_real_matrices);
    svt_av1_SNRs_imag = calculate_SNR(imag_matrix_rescaled_255,svt_av1_imag_matrices);
    'SVT-AV1 SNR calc: END'

    % RENDERING BLOCK (for SVT-AV1)
    'SVT-AV1 hologram reconstruction: START'
    recontruction_SVT_AV1 = codec_regen(hologram_path, hologram_name,'SVT_AV1',svt_av1_real_matrices, svt_av1_imag_matrices, min_raw_complex_real, ...
        max_raw_complex_real, min_raw_complex_imag, max_raw_complex_imag, width, height, wlen, area, zrec);
    'SVT-AV1 hologram reconstruction: END'

    % PSNR calc. for SVT-AV1
    'SVT-AV1 PSNR Calc: START'
    SVT_AV1_psnr = calculate_PSNR(reconstruction_vanilla,recontruction_SVT_AV1);
    'SVT-AV1 PSNR Calc: END'
    'File cleaning...'
    clear svt_av1_real_matrices svt_av1_imag_matrices recontruction_SVT_AV1
    'SVT-AV1 operations: END'

    %% DEBUG SVT-AV1
    if DEBUG == 1
        debug_svt_av1
    end
    % -- end DEBUG SVT-AV1 --