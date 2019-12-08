echo off
set in_dir=c:\vid-src
set out_dir=c:\vid-res

for %%a in (%in_dir%\*.mpg) do (
  rem echo "%%~na.mp4"
  rem fm -i "%%a" -c:v mpeg2video -b:v 1500k -bf 2 -vf yadif=0:0:0 -c:a copy "%out_dir%\%%~nxa"
  rem fm -i "%%a" -c:v libx264 -crf 26 -bf 2 -vf yadif=0:0:0 -c:a copy "%out_dir%\%%~nxa"
  rem fm -i "%%a" -c:v libx264 -crf 26 -bf 2 -vf yadif=0:0:0 -c:a libmp3lame -b:a 128k "%out_dir%\%%~nxa"
  fm -hide_banner -i "%%a" -c:v libx264 -crf 26 -bf 2 -vf yadif=0:0:0 -c:a libmp3lame -b:a 128k "%out_dir%\%%~na.mp4"
)
pause
