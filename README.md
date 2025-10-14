# 3d-pose-baseline-vmd

Official Website: https://github.com/una-dinosauria/3d-pose-baseline

# wayne931121/3d-pose-baseline-vmd
forked from https://github.com/miu200521358/3d-pose-baseline-vmd
# Debugger wayne931121
3d-pose-baseline-vmd debug by wayne931121 at 20251014. 

It has many bug. 

Because It not tell me the correct packages version he used. 

I used 10 hours to debug.

debug at: https://github.com/wayne931121/3d-pose-baseline-vmd/tree/master/src

# MY ENV

https://github.com/wayne931121/3d-pose-baseline-vmd/blob/master/environment.yml

## Key Points

- python and pip version (or you may install or build package failed)
- tensorflow and some other relation packages version
- matplotlib version
- numpy version

# MY DEVICE INFO

 - Windows 11
 - Miniforge Conda
 - CUDA 12.1 device with cudnn (installed and setted up env path)
 - NVIDIA GeForce RTX 4050 (6GB, installed driver)

# Download h36m

See: http://vision.imar.ro/human3.6m/description.php

See: https://github.com/anibali/h36m-fetch?tab=readme-ov-file#usage

Put files like this
```
3d-pose-baseline-vmd/
   data/
       h36m/
           S1/
           ...
   src/
   ...
```

# Train (create model)

See: https://github.com/ArashHosseini/3d-pose-baseline

For more details, read: https://github.com/wayne931121/3d-pose-baseline-vmd/blob/master/src/predict_3dpose.py

# Also See:

https://github.com/CMU-Perceptual-Computing-Lab/openpose

https://github.com/CMU-Perceptual-Computing-Lab/openpose/issues/1204

https://github.com/miu200521358/VMD-3d-pose-baseline-multi

⭐ https://github.com/errno-mmd/VMD-Lifting

https://github.com/DenisTome/Lifting-from-the-Deep-release

https://github.com/peterljq/OpenMMD

