call activate C://ai1
cd %~dp0
rem idk why echo is off after conda activate
@echo on
rem idk why chcp 65001 need run after conda activate, or it will activate failed
chcp 65001
set USE_LIBUV=0
set KMP_DUPLICATE_LIB_OK=TRUE
set PERSON_IDX=1
set IS_DEBUG=warn
set VERBOSE=1
set OPENPOSE_JSON=C:\TEST\testv\_json
python src/openpose_3dpose_sandbox_vmd.py --camera_frame --residual --batch_norm --dropout 0.5 --max_norm --evaluateActionWise --use_sh --epochs 1 --load 24371 --gif_fps 30 --verbose 1 --openpose C:\TEST\testv\_json --person_idx 1

cmd