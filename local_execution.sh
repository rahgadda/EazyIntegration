#!/bin/bash

# -- Setting Jbang
mkdir -m740  
curl -Ls "https://github.com/jbangdev/jbang/releases/download/v0.102.0/jbang-0.102.0.zip" --output jbang.zip && jar xf jbang.zip && rm jbang.zip && mv jbang-* jbang
cp -R jbang ~
chmod +x ~/jbang/bin/jbang
export PATH=$PATH:~/jbang/bin
exit

# -- Installing Jbang Camel
export PATH=$PATH:~/jbang/bin
jbang trust add https://github.com/apache/camel/
jbang app install camel@apache/camel

# -- Running Route
camel run ./route/remote-post-http.yaml

# -- Verirification
jbang app list
sudo apt install net-tools
netstat -tulpn | grep LISTEN
curl --request POST --url http://localhost:8080/camel/api/post --header 'content-type: application/json' --data '{"test":"hello world"}'