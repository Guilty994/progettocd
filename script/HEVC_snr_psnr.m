% parameters passed in the functions are in the workspace
%% HEVC
'HEVC operations: START'
hevc_real_matrices = encode_decode_HEVC(real_matrix_rescaled_255, height, width, hologram_name, hologram_path, 'real');
hevc_imag_matrices = encode_decode_HEVC(imag_matrix_rescaled_255, height, width, hologram_name, hologram_path, 'imag');

    % SNR calculation
    'HEVC SNR calc: START'
    hevc_SNRs_real = calculate_SNR(real_matrix_rescaled_255,hevc_real_matrices);
    hevc_SNRs_imag = calculate_SNR(imag_matrix_rescaled_255,hevc_imag_matrices);
    'HEVC SNR calc: END'
    
    % RENDERING BLOCK (for HEVC)
    'HEVC hologram reconstruction: START'
    recontruction_HEVC = codec_regen(hologram_path, hologram_name,'HEVC',hevc_real_matrices, hevc_imag_matrices, min_raw_complex_real, ...
        max_raw_complex_real, min_raw_complex_imag, max_raw_complex_imag, width, height, wlen, area, zrec);
    'HEVC hologram reconstruction: END'

    % PSNR calc. for HEVC
    'HEVC PSNR Calc: START'
    HEVC_psnr = calculate_PSNR(reconstruction_vanilla,recontruction_HEVC);
    'HEVC PSNR Calc: END'
    'File cleaning...'
    clear hevc_real_matrices hevc_imag_matrices recontruction_HEVC;
    'HEVC operations: END'

    %% DEBUG HEVC
    if DEBUG == 1
        debug_hevc
    end
    % -- end DEBUG HEVC --