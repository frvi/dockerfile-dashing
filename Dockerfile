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

# Create dashing data, install custom widgets
#  - Hotness Widget: https://gist.github.com/rowanu/6246149
#  - fork of Hotness: https://gist.github.com/munkius/9209839
#  - Random Aww plugin: https://gist.github.com/chelsea/5641535
RUN cd /; mkdir dashing; dashing new dashing; cd dashing; bundle; dashing install 9209839; dashing install 5641535
RUN ln -s /dashing/dashboards /dashboards
RUN ln -s /dashing/jobs /jobs

# If you want to use a local edits of dashing dashboard,
# containing layout.erb and sample.erb, add
#   -v=/local/dashboards:/dashboards
#   -v=/your/jobs:/jobs
VOLUME /dashboards
VOLUME /jobs

EXPOSE 3030
WORKDIR /dashing

CMD dashing start
