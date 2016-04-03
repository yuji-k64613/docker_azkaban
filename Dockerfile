FROM debian:latest
MAINTAINER Yuji Konishi

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y unzip
RUN apt-get install -y openjdk-7-jdk

#
# azkaban
#
RUN mkdir /root/build
WORKDIR /root/build
RUN git clone https://github.com/azkaban/azkaban.git
WORKDIR /root/build/azkaban
RUN ./gradlew distTar
RUN ./gradlew distZip
WORKDIR /root
RUN tar zxvf ./build/azkaban/build/distributions/azkaban-solo-server-3.0.0.tar.gz
RUN ln -s azkaban-solo-server-* azkaban

ADD script.sh /tmp/script.sh
CMD [ "/tmp/script.sh" ]
