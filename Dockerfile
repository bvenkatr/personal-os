FROM ubuntu:14.04
MAINTAINER Venkat <venkat.jaa@gmail.com>

RUN apt-get update

# In below line -y means yes. That is you might be able to answer the prompts when installing programs
RUN apt-get install -y curl
RUN apt-get install -y vim

# Installing nodejs
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN apt-get install -y nodejs

# update npm version
RUN npm -g update

