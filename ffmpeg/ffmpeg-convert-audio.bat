@echo off
echo.

set ORIG_DIR=_orig

set f_aac="%cd%\*.aac"
set f_aiff="%cd%\*.aiff"
set f_ape="%cd%\*.ape"
set f_flac="%cd%\*.flac"
set f_m4a="%cd%\*.m4a"
set f_m4b="%cd%\*.m4b"
set f_m4p="%cd%\*.m4p"
set f_ogg="%cd%\*.ogg"
set f_wav="%cd%\*.wav"
set f_wma="%cd%\*.wma"
set f_ac3="%cd%\*.ac3"

set bitrate=320

echo.
if not "%1"=="" (
  echo -- using bitrate %1 kbps
  set bitrate=%1
) else (
  echo -- default bitrate %bitrate% kbps
)
echo.

mkdir %ORIG_DIR%

for %%a in (%f_aac% %f_aiff% %f_ape% %f_flac% %f_m4a% %f_m4b% %f_m4p% %f_ogg% %f_wav% %f_wma% %f_ac3%) do (
  rem echo %%a
  rem echo %%~na
  rem echo %%~nxa
  
  move "%%~nxa" "%ORIG_DIR%\"
  fm -y -hide_banner -i "%ORIG_DIR%\%%~nxa" -codec:a libmp3lame -b:a %bitrate%k -ar 44100 -map_metadata 0 -id3v2_version 3 "%%~na.mp3"
)

echo.
