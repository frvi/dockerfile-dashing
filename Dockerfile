FROM dockerfile/ruby

MAINTAINER Fredrik Vihlborg <fredrik.wihlborg@gmail.com>

# Disable frontend warnings
ENV DEBIAN_FRONTEND noninteractive
ENV DASH_WORKSPACE dashing

# Install Node.js
#
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y nodejs

# Install dashing
#
RUN gem install dashing

# Create dashing-data folder
#
RUN mkdir -p /dashing

# Create dashing data, install custom widgets
#
#  - Hotness Widget: https://gist.github.com/rowanu/6246149
#
RUN cd /; dashing new $DASH_WORKSPACE;cd $DASH_WORKSPACE; bundle; dashing install 6246149
RUN ln -s /dashing/dashboards /dashboards
RUN ln -s /dashing/jobs /jobs

EXPOSE 3030

WORKDIR /dashing

# If you want to use a local edits of dashing dashboard,
# containing layout.erb and sample.erb, add
#   -v=/local/dashboards:/dashboards
#   -v=/your/jobs:/jobs
#
VOLUME /dashboards
VOLUME /jobs

# Start dashing, and ugly (de facto?) hack to keep it running
# TODO: fix ugly hack
CMD dashing start -d && sleep 1 && tail -F /dashing/log/thin.log
