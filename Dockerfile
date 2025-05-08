FROM amazoncorretto:21-alpine-jdk@sha256:937a7f5c5f7ec41315f1c7238fd9ec0347684d6d99e086db81201ca21d1f5778

ARG BUILD_DATE
ARG COMMIT_SHA
ARG BUILD_URL

LABEL org.opencontainers.image.title="Hyland Experience Amazon Corretto Sambuca Image" \
 org.opencontainers.image.source="https://github.com/HylandSoftware/corretto-sambuca-opencv" \
 org.opencontainers.image.created=$BUILD_DATE \
 org.opencontainers.image.revision=$COMMIT_SHA \
 org.opencontainers.image.url=$BUILD_URL

RUN apk --no-cache -U upgrade

RUN apk --no-cache add curl  ca-certificates
 
RUN apk --no-cache add clang cmake ninja wget linux-headers python3

# Build and install OpenCV
RUN set -ex && \
	wget -O opencv.zip https://github.com/opencv/opencv/archive/4.10.0.zip && \
	unzip opencv.zip && \
	mv opencv-4.10.0 opencv && \
	mkdir -p build && cd build && \
	cmake -DBUILD_SHARED_LIBS=OFF -GNinja ../opencv && \
	ninja && \
	rm /opencv.zip

RUN apk del wget