# ChannelTube

ChannelTube is a tool for synchronizing and fetching content from YouTube channels using yt-dlp.

This version includes enhancements such as episode numbering, chronological sorting, Docker Compose deployment, and configurable storage using environment variables.



## 🚀 Quick Start

```bash
git clone https://github.com/lomanneh61/ChannelTube.git
cd ChannelTube
cp .env.example .env
nano .env
docker compose up -d --build
```


## 🐳 Run using Docker Compose

```yaml
services:
  channeltube:
    build: .
    container_name: channeltube

    ports:
      - "5000:5000"

    volumes:
      - ${HOST_DOWNLOADS}:/channeltube/downloads
      - ${HOST_CONFIG}:/app/config

    restart: unless-stopped
 ```   

## ⚙️ Configuration

### Create your environment file

```bash
cp .env.example .env
nano .env
```


### Set your paths

```env
HOST_DOWNLOADS=/path/to/your/download/folder

HOST_CONFIG=/path/to/your/config/folder
```


## ▶️ Run Commands

### Start the application

```bash
docker compose up -d --build
```

### Stop the application

```bash
docker compose down
```

## 📂 Output Structure

```text

downloads/
  Channel Name/
    Season 2026/
      s2026.e0001 - Video Title.mp4
      s2026.e0002 - Video Title.mp4
```
## 🎵 Optional: Audio Downloads

```yaml

- ${HOST_AUDIO_DOWNLOADS}:/channeltube/audio_downloads
```

## And define it in your .env file:

```env

HOST_AUDIO_DOWNLOADS=/path/to/audio/folder
```


## ✨ Features

- ✅ Automatic YouTube channel syncing  
- ✅ Episode numbering (sYYYY.e0001 format)  
- ✅ Chronological sorting by upload date  
- ✅ Docker Compose-based deployment  
- ✅ Configurable storage via .env  
- ✅ NAS-compatible storage support  
- ✅ Persistent downloads across restarts  



🔧 Notes

Plex/Jellyfin integration depends on correct server IP configuration.
Ensure your download paths have the proper permissions (e.g., PUID=1000).
.env is not tracked in Git — use .env.example as a template.



## 📜 License

This project is licensed under the terms of the GNU General Public License v3.0 (GPL-3.0).  
See the LICENSE file for full details.
