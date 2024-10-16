#!/usr/bin/env bash

sed -i "s/@BENCH_IP@/$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')/g" /vsomeip/_benchmark/hello_world/conf/client.json
sed -i "s/@BENCH_IP@/$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')/g" /vsomeip/_benchmark/hello_world/conf/service.json
sed -i "s/@BENCH_IP@/$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')/g" /vsomeip/_benchmark/request_response/conf/client.json
sed -i "s/@BENCH_IP@/$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')/g" /vsomeip/_benchmark/request_response/conf/service.json
ip route add 224.224.224.245 dev eth0
exec "$@"