#!/bin/bash

curl -Ls "https://github.com/jbangdev/jbang/releases/download/v0.102.0/jbang-0.102.0.zip" --output jbang.zip && jar xf jbang.zip && rm jbang.zip && mv jbang-* jbang
docker build -t rahgadda/eazyintegration .
docker push rahgadda/eazyintegration