FROM ubuntu:bionic

MAINTAINER benne@klimlive.de

RUN apt-get -qq update && apt-get -qq install -y \
  libsoup2.4-1 libarchive13 libgtk-3-0 git imagemagick \
  wget gconf-service lib32gcc1 lib32stdc++6 libasound2 \
  libc6 libc6-i386 libcairo2 libcap2 libcups2 libdbus-1-3 \
  libexpat1 libfontconfig1 libfreetype6 libgcc1 libgconf-2-4 \
  libgdk-pixbuf2.0-0 libgl1-mesa-glx libglib2.0-0 \
  libglu1-mesa libgtk2.0-0 libnspr4 libnss3 libpango1.0-0 \
  libstdc++6 libx11-6 libxcomposite1 libxcursor1 libxdamage1 \
  libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxtst6 \
  zlib1g debconf xdg-utils build-essential xvfb sudo

COPY start.sh /home/user/

RUN export uid=1000 gid=1000 \
  && mkdir -p /home/ /home/user/ /opt/Unity-2018.2.0f2/ \
  && wget https://beta.unity3d.com/download/10189b18f56e/UnitySetup-2018.2.0f2 -O /home/user/UnitySetup \
  && chmod +x /home/user/start.sh \
  && chmod +x /home/user/UnitySetup \
  && chown -Rv ${uid}:${gid} /home/user \
  && chown -Rv ${uid}:${gid} /opt \
  && echo 'user ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

WORKDIR /home/user

CMD ["/home/user/start.sh"]
