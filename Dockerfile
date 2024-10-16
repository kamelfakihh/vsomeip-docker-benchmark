ARG BASE_IMAGE=ubuntu:22.04
# ARG BASE_IMAGE=ubuntu:14.04
FROM ${BASE_IMAGE}

ARG VSOMEIP_VERSION=3.4.10
ARG BOOST_VERSION=1.66.0
# ARG VSOMEIP_VERSION=2.10.11
# ARG BOOST_VERSION=1.55.0


ARG BOOST_TAR="boost_${BOOST_VERSION//./_}"
ARG BOOST_URL="http://downloads.sourceforge.net/project/boost/boost/${BOOST_VERSION}/${BOOST_TAR}.tar.gz"

RUN apt update
RUN apt install -y cmake build-essential libssl-dev iproute2 wget git coreutils

WORKDIR /
RUN wget ${BOOST_URL}
RUN tar -zxvf ${BOOST_TAR}.tar.gz
WORKDIR /${BOOST_TAR}
RUN ./bootstrap.sh
RUN ./b2 --with=all -j `nproc` install || true

WORKDIR /
RUN git clone --branch ${VSOMEIP_VERSION} https://github.com/COVESA/vsomeip.git

RUN mkdir -p /vsomeip/build
WORKDIR /vsomeip/build
RUN cmake ..
RUN make
RUN make install
RUN ldconfig

COPY . /vsomeip/_benchmark
WORKDIR /vsomeip/_benchmark/request_response
RUN mkdir -p /vsomeip/_benchmark/request_response/build
WORKDIR /vsomeip/_benchmark/request_response/build
RUN cmake ..
RUN make

WORKDIR /vsomeip/_benchmark/hello_world
RUN mkdir -p /vsomeip/_benchmark/hello_world/build
WORKDIR /vsomeip/_benchmark/hello_world/build
RUN cmake ..
RUN make

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]