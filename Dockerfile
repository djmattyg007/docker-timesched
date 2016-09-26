FROM djmattyg007/arch-runit-base:2016.09.26-1
MAINTAINER djmattyg007

ENV TIMESCHEDIMAGE_VERSION=2016.09.26-3

# Add install bash script
COPY setup/root/*.sh /root/
COPY setup/init.sh /etc/service/nginx/run
COPY setup/*.ngx /etc/timesched/nginx/

ENV TIMESCHED_VERSION=1

# Run bash script to install nginx and download the timesched code
RUN /root/install.sh && \
    rm /root/*.sh

ENTRYPOINT ["/usr/bin/init"]
