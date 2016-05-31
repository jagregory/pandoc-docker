FROM haskell:7.10

# will ease up the update process
# updating this env variable will trigger the automatic build of the Docker image
ENV PANDOC_VERSION "1.16.0.2"

# install pandoc
RUN cabal update && cabal install pandoc-${PANDOC_VERSION}

# update /etc/apt/sources.list to stretch distribution
RUN echo "deb http://ftp.us.debian.org/debian/ stretch main contrib non-free" | tee -a /etc/apt/sources.list
RUN echo "deb-src http://ftp.us.debian.org/debian/ stretch main contrib non-free" | tee -a /etc/apt/sources.list

# install latex packages
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends --fix-missing \
    texlive-full \
    fontconfig \
    curl

WORKDIR /source
