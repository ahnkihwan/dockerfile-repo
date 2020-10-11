FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install apache2 -y
EXPOSE 80
CMD /bin/bash

