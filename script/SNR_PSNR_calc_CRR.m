% parameters passed in the functions are in the workspace
%% VANILLA RENDERING (!!! First of all, run this !!!)
reconstruction_vanilla = vanilla_regen(hologram_path, hologram_name, width, height, wlen, area, zrec, Hol);

% Code blocks below can be ran in any order
%% HEVC
HEVC_snr_psnr;

%% JPEG2000
JPEG2000_snr_psnr;

%% SVT-AV1
if width <= 4096
    SVT_AV1_snr_psnr;
else
    'Hologram width is bigger than SVT-AV1 max supported width'
end
%% libaom AV1
libaom_AV1_snr_psnr;

%% PSNR CALCULATION
% 1. (FOR EVERY CODEC) Get decompressed matrices (real and imaginary) 
%    and dequantize; remap them to their original range.
% 2. Combine decompressed matrices in a single complex matrix.
% 3. Perform numeric reconstruction of the complex matrix obtained in step 2 with ASM.
% 4. Perform numeric reconstruction of the starting complex matric (raw hologram).
% 5. Perform PSNR calculation between the matrices obtained in step 4 and step 3.


