FROM ubuntu
MAINTAINER James Gregory <james@jagregory.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" > /etc/apt/sources.list

# install haskell
RUN apt-get update -y && apt-get install -y haskell-platform

# install pandoc
RUN cabal update && cabal install pandoc

# install latex packages
RUN apt-get update -y && apt-get install -y texlive-latex-base texlive-xetex latex-xcolor texlive-math-extra texlive-latex-extra texlive-fonts-extra biblatex curl wget git fontconfig make

RUN mkdir -p /source
WORKDIR /source

ENTRYPOINT ["/.cabal/bin/pandoc"]
CMD ["--help"]
