FROM ubuntu:17.10
MAINTAINER Stephen Olesen <slepp@slepp.ca>

RUN apt-get update \
	&& apt-get install -y \
		wget \
		openjdk-8-jre \
		xvfb \
                xz-utils \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ENV ARDUINO_IDE_VERSION 1.8.5
RUN (wget -q -O- https://downloads.arduino.cc/arduino-${ARDUINO_IDE_VERSION}-linux64.tar.xz \
	| tar xJC /usr/local/share \
	&& ln -s /usr/local/share/arduino-${ARDUINO_IDE_VERSION} /usr/local/share/arduino \
	&& ln -s /usr/local/share/arduino-${ARDUINO_IDE_VERSION}/arduino /usr/local/bin/arduino)

COPY ./start-xvfb.sh /usr/local/bin/start-xvfb

ENV DISPLAY :1.0

COPY ./start-session.sh /usr/local/bin/start-session

CMD ["/bin/bash"]

ENTRYPOINT ["/usr/local/bin/start-session"]
