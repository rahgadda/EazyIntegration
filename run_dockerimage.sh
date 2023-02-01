#!/bin/bash

# -- Test docker file
docker run -d -p 8080:8080 -p 8888:8888  --name test-eazyintegration rahgadda/eazyintegration 
curl --request POST --url http://httpbin.org/post --header 'content-type: application/json' --data '{"mytext": "message"}'
curl --request POST --url http://localhost:8080/camel/api/post --header 'content-type: application/json' --data '{"test":"hello world"}'

# -- Run in Debug using bash
docker run --rm -it -p 8080:8080 -p 8888:8888 rahgadda/eazyintegration bash
docker exec -it rahgadda/eazyintegration rahgadda/eazyintegration bashcame