# Evaluation of compression technique on holographic data using standard codec for image and video

In this repo we aim to implement the workflow proposed in the experimental work *Performance of Standard Codecs and Image Quality Assessment at Different Distances and Perspectives* to give a proper evaluation of CGH (Computer Generated Hologram) generated with differents algorithms. 

# Requirements 

- Windows 10
- Matlab
  - Image Processing Toolbox
  - Signal Processing Toolbox

# Usage

- The command ``` setup_environment ``` will generate the workspace and download the datasets.

- The command ``` benchmark ``` will start the benchmarking process on all existing datasets.

For more documentation please refer to the related paper [LINK].

# Project structure

```

+ root  +
	|
	+ codec +
	|	|
	|	+ HEVC
	|	|
	|	+ JPEG2000 +
	|	|	   |
	|	|	   + lib +
	|	|	   |
	|	|	   + kakadu
	|	|		   	
	|	+ SVT-AV1
	|	|
	|	+ AV1_libaom
	|	|
	|	+ ffmpeg
	|
	+ dataset +
	|	  |
	|	  + Interfere1 +
	|	  |	       |
	|	  |	       + 3D_Cat +
	|	  |	       |	|
	|	  |	       |        + bin
	|	  |	       |	|
	|	  |	       |	+ j2c
	|	  |	       |        |
	|	  |	       |	+ jpeg
	|	  |	       |	|
	|	  |	       |	+ pgm
	|	  |	       |	|
	|	  |	       |	+ yuv
	|	  |    	       |
	|	  |	       + 3D_Multi +
	|	  |	       |	  |
	|	  |	       |	  + bin
	|	  |	       |	  |
	|	  |	       |	  + j2c
	|	  |	       |	  |
	|	  |	       |   	  + jpeg
	|	  |	       |	  |
	|	  |	       |   	  + pgm
	|	  |	       |	  |
	|	  |	       |	  + yuv
	|	  |    	       |
	|	  |	       + 3D_Venus +
	|	  |	       |	  |
	|	  |	       |	  + bin
	|	  |	       |          |
	|	  |	       |	  + j2c
	|	  |	       |	  |
	|	  |	       |          + jpeg
	|	  |	       |	  |
	|	  |	       |	  + pgm
	|	  |	       |	  |
	|	  |	       |	  + yuv
	|	  |
	|	  + Interfere2 + 
	|	  |	       | 
	|	  |	       + cat8KD +
	|	  |	       |	|
	|	  |	       |	+ bin
	|	  |	       |	|
	|	  |	       |	+ j2c
	|	  |	       | 	|
	|	  |	       |	+ jpeg
	|	  |	       |	|
	|	  |	       |	+ pgm
	|	  |	       |	|
	|	  |	       |	+ yuv
	|	  |    	       |
	|	  |	       + venus8KD +
	|	  |	       | 	  |
	|	  |	       | 	  + bin
	|	  |	       |	  |
	|	  |	       |	  + j2c
	|	  |	       |	  |
	|	  |	       |	  + jpeg
	|	  |	       |	  |
	|	  |	       |	  + pgm
	|	  |	       |	  |
	|	  |	       |	  + yuv
	+ debug	  
	|
	+ script +
	|	 |
	|	 + CompReg_Rendering
	|	 |
	|	 + benchmark_utils
	|	 |
	|	 + TF
	|	 |
	|        + YUV
```
