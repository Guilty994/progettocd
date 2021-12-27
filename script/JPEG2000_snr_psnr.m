% parameters passed in the functions are in the workspace
%% JPEG2000
'JPEG2000 operations: START'
%function require not rescaled matrix (rescaling is performed inside encode_decode_JPEG2000 function)
jpeg2000_real_matrices = encode_decode_JPEG2000(real_matrix_rescaled_0_1, hologram_name, hologram_path, 'real');
jpeg2000_imag_matrices = encode_decode_JPEG2000(imag_matrix_rescaled_0_1, hologram_name, hologram_path, 'imag');

    % SNR calculation
    'JPEG2000 SNR calc: START'
    jpeg2000_SNRs_real = calculate_SNR(real_matrix_rescaled_255,jpeg2000_real_matrices);
    jpeg2000_SNRs_imag = calculate_SNR(imag_matrix_rescaled_255,jpeg2000_imag_matrices);
    'JPEG2000 SNR calc: END'

    % RENDERING BLOCK (for JPEG2000)
    'JPEG2000 hologram reconstruction: START'
    recontruction_JPEG2000 = codec_regen(hologram_path, hologram_name,'JPEG2000',jpeg2000_real_matrices, jpeg2000_imag_matrices, min_raw_complex_real, ...
        max_raw_complex_real, min_raw_complex_imag, max_raw_complex_imag, width, height, wlen, area, zrec);
    'JPEG2000 hologram reconstruction: END'

    % PSNR calc. for JPEG2000
    'JPEG2000 PSNR Calc: START'
    JPEG2000_psnr = calculate_PSNR(reconstrution_vanilla,recontruction_JPEG2000);
    'JPEG2000 PSNR Calc: END'
    'JPEG2000 operations: END'

    %% DEBUG JPEG2000

    if DEBUG == 1
        debug_jpeg2000
    end
    % -- end DEBUG JPEG2000 --