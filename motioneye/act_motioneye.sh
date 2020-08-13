#!/usr/bin/bash
mkdir -p /home/jligon/motioneye/storage

#gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video2

podman run --name="motioneye" \
    -p 8765:8765 \
    -p 8080:8080 \
    -p 8081:8081 \
    --hostname="motioneye" \
    --annotation run.oci.keep_original_groups=1 \
    --device=/dev/video0 \
    -v /etc/localtime:/etc/localtime:Z \
    -v /home/jligon/motioneye:/etc/motioneye:Z \
    -v /home/jligon/motioneye/storage:/var/lib/motioneye:Z \
    --detach=true \
    ccrisan/motioneye:master-amd64
