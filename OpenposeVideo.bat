chcp 65001

REM ! THIS FILE ORIGINALLY FROM https://github.com/peterljq/OpenMMD/blob/master/OpenPose-Video.bat
REM ! THIS FILE MODIFY BY WAYNE931121 20251013

@echo on


cd /d %~dp0

rem @echo off

echo "Notice only can use ansi code (english) in path, or may be error!"

echo "Notice if you video file in C://, you need use administrator mode, or may be error (no write permission)."

rem pause

rem ---  access the video

echo Please input the path of video

set INPUT_VIDEO=

set /P INPUT_VIDEO=■the path of video: 

rem echo INPUT_VIDEO：%INPUT_VIDEO%



IF /I "%INPUT_VIDEO%" EQU "" (

    ECHO Input error, the analysis terminates.

    EXIT /B

)



rem ---  Max number of people in the video


echo --------------

echo Max number of person in the video

echo Press "enter" to set the default: 1 person

set NUMBER_PEOPLE_MAX=1

set /P NUMBER_PEOPLE_MAX="Max number of people in the video: "



rem --echo NUMBER_PEOPLE_MAX: %NUMBER_PEOPLE_MAX%



rem -----------------------------------

rem --- Video input

FOR %%1 IN (%INPUT_VIDEO%) DO (

    set INPUT_VIDEO_DIR=%%~dp1

    set INPUT_VIDEO_FILENAME=%%~n1

)





set DT=%date%



set TM=%time%



set TM2=%TM: =0%



set DTTM=%dt:~0,4%%dt:~5,2%%dt:~8,2%_%TM2:~0,2%%TM2:~3,2%%TM2:~6,2%



echo --------------



rem ------------------------------------------------

rem -- output json files
set OUTPUT_JSON_DIR=%INPUT_VIDEO_DIR%_json

rem echo %OUTPUT_JSON_DIR%



mkdir %OUTPUT_JSON_DIR%

echo JSON files will be outputted: %OUTPUT_JSON_DIR%



rem ------------------------------------------------

set OUTPUT_VIDEO_PATH=%INPUT_VIDEO_DIR%_openpose.avi

echo Output AVI files：%OUTPUT_VIDEO_PATH%



echo --------------

echo Openpose started.

echo Press ESC to break the process.

echo --------------


pushd C:\Users\原神\Downloads\openpose-1.7.0-binaries-win64-gpu-python3.7-flir-3d_recommended\openpose

"bin\OpenPoseDemo.exe" --video %INPUT_VIDEO% --write_json %OUTPUT_JSON_DIR% --write_video %OUTPUT_VIDEO_PATH% --number_people_max %NUMBER_PEOPLE_MAX% 

popd

echo --------------

echo Done!

echo Openpose analysis finished.

echo Next step: using 3d-pose-baseline-vmd to process the JSON files.

echo %OUTPUT_JSON_DIR%


pause

