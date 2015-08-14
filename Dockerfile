FROM ubuntu:14.04
RUN apt-get update

# In below line -y means yes. That is you might be able to answer the prompts when installing programs
RUN apt-get install -y curl
RUN apt-get install -y vim
