FROM resin/armhf-alpine:3.7

LABEL io.resin.device-type="kitra710"

RUN apk add --update \
		less \
		nano \
		net-tools \
		ifupdown \		
		usbutils \
		gnupg \
	&& rm -rf /var/cache/apk/*
