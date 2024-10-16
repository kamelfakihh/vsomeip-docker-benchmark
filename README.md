# vsomeip-docker-benchmark
[vsomeip](https://github.com/COVESA/vsomeip.git) benchmark running in docker containers. The bencmark implementatoin is taken from [github.com/netgroup-polito/secure-vsomeip](https://github.com/netgroup-polito/secure-vsomeip.git) and slightly modified to run in a container.

# how to run it

1. build image :
```
git clone https://github.com/kamelfakihh/vsomeip-docker-benchmark.git
cd vsomeip-docker-benchmark
sudo docker build -t vsomeip-bench . --build-arg BASE_IMAGE=ubuntu:22.04 --build-arg VSOMEIP_VERSION=3.5.1 --build-arg BOOST_VERSION=1.55.0
```
2. run client :
```
sudo docker run -it --privileged -e VSOMEIP_CONFIGURATION=/vsomeip/_benchmark/hello_world/conf/client.json vsomeip-bench /vsomeip/_benchmark/hello_world/build/hello_world_client
```
4. run service :
```
sudo docker run -it --privileged -e VSOMEIP_CONFIGURATION=/vsomeip/_benchmark/hello_world/conf/service.json vsomeip-bench /vsomeip/_benchmark/hello_world/build/hello_world_service
```
