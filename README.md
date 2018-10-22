# phantomjs-sandbox

A companion repository for [this blog post](https://ervinb.github.io/2016/12/22/portable-build-environments-with-docker.html), about making reusable build
environments for compiling stuff from source with Docker.

## Run!

```sh
# optional build-arg for specifying which code revision
# will be checked out (2.1.1 by default)
$ git clone https://github.com/ervinb/phantomjs-sandbox.git && cd phantomjs-sandbox
$ docker build -t phantomjs-sandbox-211 --build-arg TAG=2.1.1 .
# reload your shotgun, twice
# (and get the shells from the factory)
docker run --rm --volume $(pwd)/trunk-$(date +%s):/phantomjs-src/bin phantomjs-sandbox
$ ./trunk-1482688158/phantomjs --version
> 2.1.1
```
