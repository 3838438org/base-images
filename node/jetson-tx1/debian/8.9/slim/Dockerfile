# AUTOGENERATED FILE
FROM resin/jetson-tx1-debian:jessie

ENV NODE_VERSION 8.9.3

RUN buildDeps='curl' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-arm64.tar.gz" \
	&& echo "df32e87060f5426fc6c6b1af8e3e130ae08ee36f570ac3728442c7833e53d7c3  node-v8.9.3-linux-arm64.tar.gz" | sha256sum -c - \
	&& tar -xzf "node-v$NODE_VERSION-linux-arm64.tar.gz" -C /usr/local --strip-components=1 \
	&& rm "node-v$NODE_VERSION-linux-arm64.tar.gz" \
	&& apt-get purge -y --auto-remove $buildDeps \
	&& npm config set unsafe-perm true -g --unsafe-perm \
	&& rm -rf /tmp/*

CMD ["echo","'No CMD command was set in Dockerfile! Details about CMD command could be found in Dockerfile Guide section in our Docs. Here's the link: http://docs.resin.io/deployment/dockerfile"]
