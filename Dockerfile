FROM ghcr.io/hylandsoftware/corretto-sambuca:20250321@sha256:ebc03eed0f5a7c89f4841353d95689d230af305e900cb3686b5fa33a4bdfe2b1

ARG BUILD_DATE
ARG COMMIT_SHA
ARG BUILD_URL

LABEL org.opencontainers.image.title="Hyland Experience Amazon Corretto Sambuca OpenCV Image" \
 org.opencontainers.image.source="https://github.com/HylandSoftware/hxp-transform-service" \
 org.opencontainers.image.created=$BUILD_DATE \
 org.opencontainers.image.revision=$COMMIT_SHA \
 org.opencontainers.image.url=$BUILD_URL
 
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