#!/usr/bin/env bash

RELEASE=1.3.1-anduin
dist=dist
bin=sync_gateway

function build {
    GOOS=$1 GOARCH=$2 go build -o $bin
    package=$bin-$RELEASE-$1-$2.tar.gz
    tar cvzf $package $bin
    mv $package $dist
    rm $bin
}

mkdir -p $dist
build linux amd64
