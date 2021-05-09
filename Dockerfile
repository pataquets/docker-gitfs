FROM pataquets/ubuntu:bionic

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
      gnupg \
  && \
  apt-key adv --keyserver hkp://hkps.pool.sks-keyservers.net --recv-keys 3EE61981 && \
  . /etc/lsb-release && \
  echo "deb http://ppa.launchpad.net/presslabs/gitfs/ubuntu ${DISTRIB_CODENAME} main" | \
    tee /etc/apt/sources.list.d/gitfs.list \
  && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get purge -y --autoremove \
      gnupg \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      gitfs \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/
