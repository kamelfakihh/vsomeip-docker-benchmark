# vsomeip-docker-benchmark
[vsomeip](https://github.com/COVESA/vsomeip.git) benchmark running in docker containers. The bencmark implementatoin is taken from [github.com/netgroup-polito/secure-vsomeip](https://github.com/netgroup-polito/secure-vsomeip.git) and slightly modified to run in a container.

# how to run it 

1. build image : 
```
git clone https://github.com/kamelfakihh/vsomeip-docker-benchmark.git
cd vsomeip-docker-benchmark
sudo docker build -t vsomeip-bench .
```
2. run client :
```
sudo docker run -it --privileged -e VSOMEIP_CONFIGURATION=/vsomeip/_benchmark/request_response/conf/client.json vsomeip-bench /vsomeip/_benchmark/build/bench_request_response_client
```
4. run service :
```
sudo docker run -it --privileged -e VSOMEIP_CONFIGURATION=/vsomeip/_benchmark/request_response/conf/service.json vsomeip-bench /vsomeip/_benchmark/build/bench_request_response_service
```

