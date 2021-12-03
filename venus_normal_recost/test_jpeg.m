addpath('../JPEG 2000/lib/');
addpath('../YUV/');

yuvfile = 'yuv/HOL_3D_venus.yuv';
dims = [1080 1920];
fps = 1;
brates = [2048];
numfrm = 1;

jpeg2000kakadu_yuv(yuvfile,dims,fps,brates,numfrm);