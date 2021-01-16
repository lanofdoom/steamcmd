FROM ubuntu:focal as steamcmd

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        lib32gcc1 \
        ca-certificates \
        wget \
    && mkdir -p /opt/steam \
    && wget -qO- 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar xvzf - -C /opt/steam \
    && /opt/steam/steamcmd.sh +quit \
    && apt-get remove --purge -y \
        wget \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /root/Steam/logs/* \
    && rm -rf /var/log/* \
    && rm /root/Steam/steamapps/libraryfolders.vdf