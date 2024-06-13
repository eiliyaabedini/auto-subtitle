FROM ivanlee/ffmpeg-python

RUN pip install git+https://github.com/m1guelpf/auto-subtitle.git

WORKDIR /media

COPY /models/small.pt /root/.cache/whisper/small.pt

ENTRYPOINT  ["auto_subtitle","--model","small"]
