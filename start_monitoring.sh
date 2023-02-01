#!/bin/bash

while ! camel ps | grep Running > /dev/null;
do
    sleep 1;
    echo "Waitig For Camel Route..."
done

# http://127.0.0.1:8778/jolokia/
camel jolokia remote-post-http &
# http://localhost:8888/hawtio
camel hawtio &