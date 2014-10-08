FROM frvi/ruby

MAINTAINER Fredrik Vihlborg <fredrik.wihlborg@gmail.com>

# Install dashing
RUN gem install bundle
RUN gem install dashing
RUN mkdir /dashing && \
    dashing new dashing && \
    cd /dashing && bundle
RUN ln -s /dashing/dashboards /dashboards && \
    ln -s /dashing/jobs /jobs && \
    ln -s /dashing/public /public && \
    ln -s /dashing/widgets /widgets
RUN mkdir /dashing/config && \
    mv /dashing/config.ru /dashing/config/config.ru && \
    ln -s /dashing/config/config.ru /dashing/config.ru && \
    ln -s /dashing/config /config
ADD run.sh /

# Volumes for custom dashing files; dashboards, jobs, and config
VOLUME /dashboards
VOLUME /jobs
VOLUME /config
VOLUME /public
VOLUME /widgets

EXPOSE 3030
WORKDIR /dashing

CMD ["/run.sh"]

