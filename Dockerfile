FROM ubuntu
MAINTAINER James Gregory <james@jagregory.com>

# install haskell and the latex packages
RUN echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" > /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y \
  haskell-platform
  texlive-latex-base texlive-xetex latex-xcolor texlive-math-extra \
  texlive-latex-extra texlive-fonts-extra biblatex \
  curl wget git fontconfig make

# install pandoc
RUN cabal update && cabal install pandoc

RUN mkdir -p /source
WORKDIR /source

ENTRYPOINT ["/.cabal/bin/pandoc"]
CMD ["--help"]
