#!/bin/sh

if [ "$#" = 0 ]; then
    exec pandoc --help
fi

case "$1" in
    /bin/*|sh|bash|pandoc)
        exec "$@"
        ;;
    *)
        exec pandoc "$@"
        ;;
esac
