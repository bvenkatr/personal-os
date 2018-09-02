FROM ubuntu:14.04
MAINTAINER Venkat <bvenkatr2@gmail.com>

# In below line -y means yes. That is you might be able to answer the prompts when installing programs
RUN apt-get update && \
	apt-get install -y curl && \
	apt-get install -y vim && \
	apt-get clean

# Installing nodejs
RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && \
	apt-get install -y nodejs && \
	apt-get install -y build-essential

# update npm version
RUN npm -g update

