#!/bin/bash

# -- Run in Debug using bash
docker run --rm -it -p 8080:8080 -p --name test-eazyintegration 8888:8888 rahgadda/eazyintegration bash
camel run /workspace/EazyIntegration/route/remote-post-http.yaml &
bash start_monitoring.sh
docker exec -it rahgadda/eazyintegration rahgadda/eazyintegration bash

# -- Verification
curl --request POST --url http://httpbin.org/post --header 'content-type: application/json' --data '{"mytext": "message"}'
curl --request POST --url http://localhost:8080/camel/api/post --header 'content-type: application/json' --data '{"test":"hello world"}'

# -- Delete Container
docker rm test-eazyintegration