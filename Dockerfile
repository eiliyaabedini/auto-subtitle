FROM ivanlee/ffmpeg-python

RUN pip install git+https://github.com/m1guelpf/auto-subtitle.git

RUN auto_subtitle video.mp4 --model small || true

WORKDIR /root

ENTRYPOINT  ["auto_subtitle","--model","small"]
