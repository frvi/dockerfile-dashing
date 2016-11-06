FROM alpine:latest

MAINTAINER Ramón G. Camus <rgcamus@gmail.com>

RUN apk update && apk upgrade
RUN apk add curl wget bash
RUN apk add ruby ruby-bundler nodejs

# Needed for make native extensions
RUN apk add ruby-dev g++ musl-dev make

RUN echo "gem: --no-document" > /etc/gemrc
RUN gem install bundler smashing json

# Create dashboard and link volumes
RUN smashing new smashing

WORKDIR /smashing

RUN cd /smashing 					\
    && bundle    					\
    && ln -s /smashing/dashboards /dashboards 		\
    && ln -s /smashing/jobs       /jobs 		\
    && ln -s /smashing/assets     /assets		\
    && ln -s /smashing/lib        /lib-smashing		\
    && ln -s /smashing/public     /public 		\
    && ln -s /smashing/widgets    /widgets 		\
    && mkdir /smashing/config 				\
    && mv /smashing/config.ru /smashing/config/config.ru  	\
    && ln -s /smashing/config/config.ru /smashing/config.ru  	\
    && ln -s /smashing/config 	  /config  			\
    && rm -rf /var/cache/apk/*

COPY run.sh /

VOLUME ["/dashboards", "/jobs", "/lib-smashing", "/config", "/public", "/widgets", "/assets"]

ENV PORT 3030
EXPOSE $PORT
WORKDIR /smashing

CMD ["/run.sh"]
