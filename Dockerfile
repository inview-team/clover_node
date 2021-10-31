FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install git -y

RUN git clone https://github.com/HeshuEU/likelib-hackaton.git ./clover

WORKDIR clover

RUN chmod +x doc/prepare_build.sh && doc/prepare_build.sh

RUN cmake -DCMAKE_BUILD_TYPE=Release -S . -B ./build

WORKDIR build

RUN make

WORKDIR bin

COPY config.json /clover/build/bin

CMD ["./node"]
