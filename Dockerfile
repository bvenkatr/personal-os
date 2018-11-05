FROM ubuntu
MAINTAINER Venkat <bvenkatr2@gmail.com>

# In below line -y means yes. That is you might be able to answer the prompts when installing programs
RUN apt-get update && \
	apt-get install -y curl && \
	apt-get install -y vim && \
	apt-get install -y gnupg && \
	apt-get install -y jq && \
	apt-get install iputils-ping && \
	apt-get install net-tools
	
# Installing nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
	apt-get install -y nodejs && \
	apt-get install -y build-essential

# update npm version
#RUN npm -g update

