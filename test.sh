# 录制
ffmpeg -rtsp_transport tcp -i "rtsp://admin:xu123456@192.168.40.81:554/cam/realmonitor?channel=1&subtype=0" -t 5 -y -c:v h264_nvenc -c:a aac -b:v 3000k out.mp4

# 畸变调整
ffmpeg -rtsp_transport tcp -i "rtsp://admin:xu123456@192.168.1.110:554/cam/realmonitor?channel=1&subtype=0"  -filter_complex "[0:v]lenscorrection=cx=0.5:cy=0.5:k1=-0.45555:k2=0.16" -t 5 -y -c:v h264_nvenc -c:a aac -b:v 3000k out.mp4

# 旋转调整
ffmpeg -rtsp_transport tcp -i "rtsp://admin:xu123456@192.168.1.110:554/cam/realmonitor?channel=1&subtype=0" -fiter_complex "[0:v]lenscorrection=cx=0.5:cy=0.5:k1=-0.45555:k2=0.16,rotate=-0.01,crop=iw:ih-10" -t 5 -y -c:v h264_nvenc -c:a aac -b:v 3000k out.mp4

# 声音
ffmpeg -rtsp_transport tcp -i "rtsp://admin:xu123456@192.168.1.110:554/cam/realmonitor?channel=1&subtype=0" -rtsp_transport tcp -i "rtsp://admin:xu123456@192.168.1.*:554/cam/realmonitor?channel=1&subtype=0" -map 0:v -map 1:a -fiter_complex "[0:v]lenscorrection=cx=0.5:cy=0.5:k1=-0.45555:k2=0.16,rotate=-0.01,crop=iw:ih-10" -t 5 -y -c:v h264_nvenc -c:a aac -b:v 3000k out.mp4

# 测速
speedtest
