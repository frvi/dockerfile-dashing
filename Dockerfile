FROM dockerfile/ruby

MAINTAINER Fredrik Vihlborg <fredrik.wihlborg@gmail.com>

# Install Node.js
RUN apt-get update
RUN apt-get install -y nodejs

# Install dashing
RUN gem install dashing

RUN dashing new mydashboard
RUN cd mydashboard
RUN bundle

RUN dashing start
