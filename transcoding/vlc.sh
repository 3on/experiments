#!/usr/bin/env bash

folder=/Volumes/Data\ HD/BuZz/Series/The\ Big\ Bang\ Theory/The.Big.Bang.Theory.S06E19.720p.HDTV.X264-DIMENSION/
tbbt=/Volumes/Data\ HD/BuZz/Series/The\ Big\ Bang\ Theory/The.Big.Bang.Theory.S06E19.720p.HDTV.X264-DIMENSION/bb.theory.619.720p-dimension.rar
topgear=/Volumes/Data\ HD/BuZz/Series/Top\ Gear/Top.Gear.S19E05.720p.REPACK.HDTV.x264-RiVER/top.gear.s19e05.720p.repack.hdtv.x264-river.rar
got=/Volumes/Data\ HD/BuZz/Series/Game.of.Thrones.S02.720p.HDTV.DD5.1.x264-EbP\ \[PublicHD\]/Game\ of\ Thrones\ S02E01\ 720p\ HDTV.DD5.1\ x264-EbP.mkv

remember=/Users/jr/Music/iTunes/iTunes\ Music/Deadmau5/Random\ Album\ Title/07\ I\ Remember.mp3

vlc=/Applications/VLC.app/Contents/MacOS/VLC

trans="#transcode{vcodec=h264, acodec=aac, channels=2, ab=128, scale=1, vb=8000, fps=24, samplerate=44100, deinterlace, audio-sync}"

videoOK=ori="#transcode{vcodec=h264, acodec=aac, channels=2, venc=x264{profile=baseline}}";

audioFix="#transcode{vcodec=h264, acodec=aac, channels=2, venc=x264{profile=baseline}, aenc=ffmpeg{aac-profile=main}, novideo}"


#$vlc "$topgear" --intf rc --verbose 42 --sout="$ori:std{access=file, mux=mp4, dst=www/topgear.mp4}"
#$vlc "$got" --intf rc --sout="$trans:std{access=file, mux=mp4, dst=www/got.mp4}"

#$vlc "$tbbt" --intf rc --verbose 42 --sout="$audioFix:std{access=file, mux=mp4, dst=www/tbbt.mp4}"

#$vlc "apple-html5-demo-tron-us_848x352.m4v" --intf rc --sout="#transcode{vcodec=h264}:std{access=file, mux=mp4, dst=www/tron.mp4}"

trans_video="vcodec=h264, venc=x264{profile=baseline}";
trans_audio="acodec=aac, channels=2 aenc=ffmpeg{aac-profile=low}";
transcode="transcode{$trans_audio, $trans_video}";

std="std{access=file, mux=mp4{pid-video=0:0, pid-audio=0:1}, dst=www/tbbt.mp4}"
$vlc "$tbbt" --intf rc --verbose 1 --sout="#$transcode:$std"


# ffmpeg -i www/tbbt.mp4 -map 0:1 -map 0:0  -c copy www/tbbt-ffmpeg.mp4

# This works !!!
#trans_audio="acodec=aac, aenc=ffmpeg{aac-profile=low}";
#transcode="transcode{$trans_audio}";
#m4a="std{access=file, mux=mp4, dst=www/remember.m4a}";
#$vlc "$remember" --intf rc --verbose 1 --sout="#$transcode:$m4a"

#ffmpeg -i "$topgear"
#ffmpeg -i "topgear.mp4"

#ffmpeg -i "$file" -vcodec h264 -acodec aac -strict -2 ffmpeg.mp4
#vlc $CHANNEL_URL --rate=1 --video-filter=scene --vout=dummy --aout=dummy --scene-format=$FORMAT --scene-ratio=24 --scene-prefix=$PREFIX --scene-path=$SNAPSHOT_PATH --scene-width=$WIDTH --scene-replace vlc://quit &