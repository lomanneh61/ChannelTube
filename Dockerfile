FROM python:3.11-slim

ARG RELEASE_VERSION
ENV RELEASE_VERSION=${RELEASE_VERSION}

RUN apt-get update && apt-get install -y \
    ffmpeg \
    gosu \
    build-essential \
    gcc \
    libffi-dev \
    libssl-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# map gosu → su-exec
RUN ln -s /usr/bin/gosu /usr/local/bin/su-exec

COPY . /channeltube
WORKDIR /channeltube

RUN pip install --upgrade pip

RUN pip install --no-cache-dir \
    --default-timeout=100 \
    --retries 10 \
    -r requirements.txt

RUN chmod +x thewicklowwolf-init.sh

EXPOSE 5000

ENTRYPOINT ["./thewicklowwolf-init.sh"]