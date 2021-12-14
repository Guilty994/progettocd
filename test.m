addpath("script\YUV\");
addpath("codec\HEVC\");



[Y_Hol3D_decoded,U_Hol3D_decoded,V_Hol3D_decoded] = yuv_import('rec.yuv',[1920 1080],1);


[Y_Hol3D_decoded_2,U_Hol3D_decoded_2,V_Hol3D_decoded_2] = yuv_import('decoded.yuv',[1920 1080],1);