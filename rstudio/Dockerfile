FROM rocker/verse:latest
ADD ./oracle_client.rpm /oracle_client.rpm
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    subversion alien  && install2.r --error \
    --deps TRUE \
    reshape2 
RUN alien -i oracle_client.rpm
RUN rm -f oracle_client.rpm
RUN install2.r --error \
    --deps TRUE \
    ROracle