% parameters passed in the functions are in the workspace
%% VANILLA RENDERING (!!! First of all, run this !!!)
reconstrution_vanilla = vanilla_regen(hologram_path, hologram_name, width, height, wlen, area, zrec, original_matrix);

% Code blocks below can be runned in any order
%% HEVC
HEVC_snr_psnr;

%% JPEG2000
JPEG2000_snr_psnr;

%% SVT-AV1
SVT_AV1_snr_psnr;

%% libaom AV1
libaom_AV1_snr_psnr;

%% CALCOLO PSNR
% 1. (PER OGNI CODEC) Prendere le matrici reale ed immaginaria decompresse e dequantizzarle
%    e ripammarle al loro range originale --> QUANDO VIENE EFFETTUATO QUESTO PUNTO?
% 2. combinare le due matrici decompresse in un'unica matrice complessa
% 3. effettuare ricostruzione numerica con ASM della matrice complessa ottenuta al punto 2.
% 4. effettuare ricostruzione numerica con ASM della matrice complessa iniziale (raw hologram)
% 5. effettuare il calcolo PSNR tra la matrice ottenuta al punto 4. e quella ottenuta al punto 3.

