# AUTOGENERATED FILE
FROM resin/aarch64-alpine-buildpack-deps:3.5

ENV NODE_VERSION 9.2.1

# Install dependencies
RUN apk add --no-cache libgcc libstdc++ libuv libcrypto1.0 libssl1.0

RUN curl -SLO "http://resin-packages.s3.amazonaws.com/node/v$NODE_VERSION/node-v$NODE_VERSION-linux-alpine-aarch64.tar.gz" \
	&& echo "964fabbb08b5a306b79e744a86c90454ab37666507bb3690beb5ed57f4b6b538  node-v9.2.1-linux-alpine-aarch64.tar.gz" | sha256sum -c - \
	&& tar -xzf "node-v$NODE_VERSION-linux-alpine-aarch64.tar.gz" -C /usr/local --strip-components=1 \
	&& rm "node-v$NODE_VERSION-linux-alpine-aarch64.tar.gz" \
	&& npm config set unsafe-perm true -g --unsafe-perm \
	&& rm -rf /tmp/*

CMD ["echo","'No CMD command was set in Dockerfile! Details about CMD command could be found in Dockerfile Guide section in our Docs. Here's the link: http://docs.resin.io/deployment/dockerfile"]
