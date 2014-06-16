FROM dockerfile/ruby

MAINTAINER Fredrik Vihlborg <fredrik.wihlborg@gmail.com>

# Disable frontend warnings
ENV DEBIAN_FRONTEND noninteractive

# Install Node.js
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y nodejs

# Install dashing
RUN gem install dashing

# RUN dashing new mydashboard;cd mydashboard; bundle
RUN cd /root; dashing new mydash;cd mydash; bundle

EXPOSE 3030

WORKDIR /root/mydash

# Start dashing, and ugly (de facto?) hack to keep it running
# TODO: fix ugly hack
CMD dashing start -d && sleep 1 && tail -F /root/mydash/log/thin.log
