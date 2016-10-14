#!/bin/sh
set -e
apk add --update go git mercurial build-base
mkdir -p /go/src/github.com/phedoreanu
cp -r /src /go/src/github.com/phedoreanu/logspout
cd /go/src/github.com/phedoreanu/logspout
export GOPATH=/go
go get
go build -ldflags "-X main.Version $1" -o /bin/logspout
apk del go git mercurial build-base
rm -rf /go
rm -rf /var/cache/apk/*

# backwards compatibility
ln -fs /tmp/docker.sock /var/run/docker.sock
