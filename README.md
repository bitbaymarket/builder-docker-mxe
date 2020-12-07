# Docker container with MXE environment

Debian-based, ready for building MXE Qt

## Build

```
docker build -f Dockerfile.gcc7 -t yshurik/mxe:gcc7 .
docker push yshurik/mxe:gcc7

docker build -f Dockerfile.gcc8 -t yshurik/mxe:gcc8 .
docker push yshurik/mxe:gcc8

docker build -f Dockerfile.gcc10 -t yshurik/mxe:gcc10 .
docker push yshurik/mxe:gcc10
```

