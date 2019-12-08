@echo off
rem for /f %%f in ('dir /b /s /a-d') do echo %%f

rem fm -hide_banner -y -f lavfi -t 2 -i anullsrc=channel_layout=mono:sample_rate=44100 -c:a libmp3lame -b:a 128k silence.mp3
rem fm -hide_banner -y -f lavfi -t 2 -i anullsrc=channel_layout=stereo:sample_rate=44100 -c:a libmp3lame -b:a 128k silence-stereo.mp3

set sp=e:\tools\bat\silence.mp3

for /f %%f in ('dir /b /s /a-d') do (
  rem echo fm -hide_banner -y -i concat:"%sp%|%%f" -codec copy "%%~dpnf__%%~xf"
  fm -hide_banner -y -i concat:"%sp%|%%f" -codec copy "%%~dpnf__%%~xf"
)
