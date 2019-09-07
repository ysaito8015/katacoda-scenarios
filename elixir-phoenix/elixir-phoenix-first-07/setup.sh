#!/bin/bash

mkdir -p /root/oiax/projects; cd /root/oiax/projects

docker pull ysaito8015/modest_greeter:ph1.2.5

docker run -it -v /root/oiax:/root/oiax -p 4000:4000 ysaito8015/modest_greeter:ph1.2.5 /bin/bash
