FROM haskell:7.10

MAINTAINER James Gregory <james@jagregory.com>

# will ease up the update process
# updating this env variable will trigger the automatic build of the Docker image
ENV PANDOC_VERSION "1.16.0.2"

# install pandoc
RUN cabal update && cabal install pandoc-${PANDOC_VERSION}

# install latex packages
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig

WORKDIR /source

ENTRYPOINT ["/root/.cabal/bin/pandoc"]

CMD ["--help"]
