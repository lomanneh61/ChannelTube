FROM python:3.11-slim

ARG RELEASE_VERSION
ENV RELEASE_VERSION=${RELEASE_VERSION}

# ✅ Install dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    build-essential \
    gcc \
    libffi-dev \
    libssl-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# ✅ Copy app
COPY . /channeltube
WORKDIR /channeltube

# ✅ Upgrade pip first (important)
RUN pip install --upgrade pip

# ✅ Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# ✅ Make script executable
RUN chmod +x thewicklowwolf-init.sh

EXPOSE 5000

ENTRYPOINT ["./thewicklowwolf-init.sh"]
