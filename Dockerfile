FROM debian:7.5

MAINTAINER Fredrik Vihlborg <fredrik.wihlborg@gmail.com>

# Disable frontend warnings
ENV DEBIAN_FRONTEND noninteractive

# Install Ruby and Node.js
RUN echo "deb http://ftp.us.debian.org/debian wheezy-backports main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y make g++ ruby-full nodejs ca-certificates

# Install dashing
RUN gem install bundle
RUN gem install dashing
RUN mkdir /dashing && \
    dashing new dashing && \
    cd /dashing && bundle
RUN ln -s /dashing/dashboards /dashboards && \
    ln -s /dashing/jobs /jobs
RUN mkdir /dashing/config && \
    mv /dashing/config.ru /dashing/config/config.ru && \
    ln -s /dashing/config/config.ru /dashing/config.ru && \
    ln -s /dashing/config /config
ADD run.sh /

# Volumes for custom dashing files; dashboards, jobs, and config
VOLUME /dashboards
VOLUME /jobs
VOLUME /config

EXPOSE 3030
WORKDIR /dashing

ENTRYPOINT ["/run.sh"]

