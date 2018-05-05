@echo off
rem --- 
rem ---  OpenPose の jsonデータから 3Dデータに変換
rem --- 

rem ---  カレントディレクトリを実行先に変更
cd /d %~dp0

rem ---  OpenPoseのjsonデータディレクトリ確認
set /P OPENPOSE_JSON="OpenPoseのjsonディレクトリパス: "
rem --- echo PERSON_IDX：%OPENPOSE_JSON%

rem ---  最大人数
set /P PERSON_IDX="出力対象人物INDEX(1始まり): "
rem --- echo PERSON_IDX：%PERSON_IDX%

rem ---  python 実行
rem --- 詳細なログが不要な場合、--verbose の後ろの数字を「2」に設定して下さい
rem --- 詳細なログが必要な場合、--verbose の後ろの数字を「3」に設定して下さい
python src/openpose_3dpose_sandbox_vmd.py --camera_frame --residual --batch_norm --dropout 0.5 --max_norm --evaluateActionWise --use_sh --epochs 200 --load 4874200 --gif_fps 30 --verbose 2 --openpose %OPENPOSE_JSON% --person_idx %PERSON_IDX%


