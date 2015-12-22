FROM ubuntu:15.10
MAINTAINER Stephen Olesen <slepp@slepp.ca>

RUN apt-get update \
	&& apt-get install -y \
		curl \
		openjdk-7-jre \
		xvfb \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/share
RUN curl -SL https://downloads.arduino.cc/arduino-1.6.5-linux64.tar.xz \
	| tar xJ \
	&& ln -s arduino-1.6.5 arduino \
	&& ln -s /usr/local/share/arduino-1.6.5/arduino /usr/local/bin/arduino

COPY ./start-xvfb.sh /usr/local/bin/start-xvfb

ENV DISPLAY :1.0

COPY ./start-session.sh /usr/local/bin/start-session

CMD ["/bin/bash"]

ENTRYPOINT ["/usr/local/bin/start-session"]
