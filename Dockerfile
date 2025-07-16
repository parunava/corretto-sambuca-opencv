FROM amazoncorretto:21-alpine-jdk@sha256:5c58f6ac8887ae9c1ebba3b80c2392a40eabfcae8e7e138ec16611ad464b1151
#FROM ghcr.io/hylandsoftware/corretto-sambuca:20250502@sha256:21ab841a2ae430f2d8ea53c292c4b4bb9314abe715c6d975edbcd709d1172595

ARG BUILD_DATE
ARG COMMIT_SHA
ARG BUILD_URL

LABEL org.opencontainers.image.title="Hyland Experience Amazon Corretto Sambuca OpenCV Image" \
 org.opencontainers.image.source="https://github.com/parunava/corretto-sambuca-opencv" \
 org.opencontainers.image.created=$BUILD_DATE \
 org.opencontainers.image.revision=$COMMIT_SHA \
 org.opencontainers.image.url=$BUILD_URL

RUN apk --no-cache -U upgrade

#RUN apk --no-cache add clang cmake ninja wget linux-headers python3

# Build and install OpenCV
#RUN set -ex && \
#	wget -O opencv.zip https://github.com/opencv/opencv/archive/4.10.0.zip && \
#	unzip opencv.zip && \
#	mv opencv-4.10.0 opencv && \
#	mkdir -p build && cd build && \
#	cmake -DBUILD_SHARED_LIBS=OFF -GNinja ../opencv && \
#	ninja && \
#	rm /opencv.zip

#RUN apk del wget