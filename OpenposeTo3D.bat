@echo off
rem --- 
rem ---  OpenPose の jsonデータから 3Dデータに変換
rem --- 

rem ---  カレントディレクトリを実行先に変更
cd /d %~dp0

rem ---  解析結果JSONディレクトリパス
echo Openposeの解析結果のJSONディレクトリのフルパスを入力して下さい。
echo この設定は半角英数字のみ設定可能で、必須項目です。
set OPENPOSE_JSON=
set /P OPENPOSE_JSON=■解析結果JSONディレクトリパス: 
rem echo OPENPOSE_JSON：%OPENPOSE_JSON%

IF /I "%OPENPOSE_JSON%" EQU "" (
    ECHO 解析結果JSONディレクトリパスが設定されていないため、処理を中断します。
    EXIT /B
)

rem ---  映像に映っている最大人数

echo --------------
echo 映像/画像の解析結果のうち、何番目の人物を解析するか1始まりで入力して下さい。
echo 何も入力せず、ENTERを押下した場合、1人目の解析になります。
set PERSON_IDX=1
set /P PERSON_IDX="解析対象人物INDEX: "

rem --echo PERSON_IDX: %PERSON_IDX%


rem ---  詳細ログ有無

echo --------------
echo 詳細なログを出すか、yes か no を入力して下さい。
echo 何も入力せず、ENTERを押下した場合、通常ログとモーションのアニメーションGIFを出力します。
echo 詳細ログの場合、各フレームごとのデバッグ画像も追加出力されます。（その分時間がかかります）
echo warn と指定すると、アニメーションGIFも出力しません。（その分早いです）
set VERBOSE=2
set IS_DEBUG=no
set /P IS_DEBUG="詳細ログ[yes/no/warn]: "

IF /I "%IS_DEBUG%" EQU "yes" (
    set VERBOSE=3
)

IF /I "%IS_DEBUG%" EQU "warn" (
    set VERBOSE=1
)

rem ---  python 実行
python src/openpose_3dpose_sandbox_vmd.py --camera_frame --residual --batch_norm --dropout 0.5 --max_norm --evaluateActionWise --use_sh --epochs 200 --load 4874200 --gif_fps 30 --verbose %VERBOSE% --openpose %OPENPOSE_JSON% --person_idx %PERSON_IDX%


