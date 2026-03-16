FROM python:3.8-slim-buster
WORKDIR /app
COPY . /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir awscli

RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg libsm6 libxext6 unzip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
