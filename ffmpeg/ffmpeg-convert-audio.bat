@echo off
echo.

rem fm -hide_banner -y -i "input.flac" -c:a libmp3lame -b:a 320k -ar 44100 -map_metadata 0 -id3v2_version 3 "output.mp3"

set TMP_DIR=c:\ctmp
set TYPES=aac ape m4a m4b m4p ogg wav wma ac3 dsf dts aiff flac webm mp4 mkv vob opus
set BIT_RATE=320

echo.
if not "%1"=="" (
  echo -- using bitrate %1 kbps
  set BIT_RATE=%1
) else (
  echo -- default bitrate %BIT_RATE% kbps
)
echo.

if %BIT_RATE%==0 (
  echo -- using best quality 220-260 kbps
  set quality=-q 0
) else (
  set quality=-b:a %BIT_RATE%k
)

mkdir %TMP_DIR%

for %%x in (%TYPES%) do (
  for %%a in ("%cd%\*.%%x") do (
    rem echo %%a
    rem echo %%~na
    rem echo %%~nxa
    
    move "%%~nxa" "%TMP_DIR%\"
    fm -hide_banner -y -i "%TMP_DIR%\%%~nxa" -c:a libmp3lame %quality% -ar 44100 -map_metadata 0 -id3v2_version 3 "%%~na.mp3"
  )
)
echo.
