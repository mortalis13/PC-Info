@echo off
echo.

rem fm -y -hide_banner -i "input.flac" -c:a libmp3lame -b:a 320k -ar 44100 -map_metadata 0 -id3v2_version 3 "output.mp3"

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
set f_dsf="%cd%\*.dsf"
set f_webm="%cd%\*.webm"

set bitrate=320

echo.
if not "%1"=="" (
  echo -- using bitrate %1 kbps
  set bitrate=%1
) else (
  echo -- default bitrate %bitrate% kbps
)
echo.

if %bitrate%==0 (
  echo -- using best quality (220-260 kbps)
  set quality=-q 0
) else (
  set quality=-b:a %bitrate%k
)

mkdir %ORIG_DIR%

for %%a in (%f_aac% %f_aiff% %f_ape% %f_flac% %f_m4a% %f_m4b% %f_m4p% %f_ogg% %f_wav% %f_wma% %f_ac3% %f_dsf% %f_webm%) do (
  rem echo %%a
  rem echo %%~na
  rem echo %%~nxa
  
  move "%%~nxa" "%ORIG_DIR%\"
  fm -hide_banner -y -i "%ORIG_DIR%\%%~nxa" -c:a libmp3lame %quality% -ar 44100 -map_metadata 0 -id3v2_version 3 "%%~na.mp3"
)

echo.
