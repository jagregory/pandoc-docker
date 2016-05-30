# Pandoc Docker Container

[Docker](https://www.docker.io/) container for the source distribution of [Pandoc](http://johnmacfarlane.net/pandoc), with the **ALL** Latex tools installed (up to stretch debian distribution), plus Curl.

    docker run -it -v `pwd`:/source strages/pandoc-docker /bin/bash
