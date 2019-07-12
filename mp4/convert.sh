#ffmpeg -i raw/run_earlyreward.mp4 -filter:v "setpts=0.1*PTS" run_earyreward_fast.mp4
ffmpeg -i raw/run_twophase.mp4 -filter:v "setpts=0.1*PTS" run_twophase_fast.mp4
