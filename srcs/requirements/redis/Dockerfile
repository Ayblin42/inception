FROM debian:buster

FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt install vim -y
RUN apt install curl -y
RUN apt-get -y install wget

RUN sudo apt install lsb-release
RUN curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

RUN sudo apt-get update
RUN sudo apt-get install redis
RUN sudo apt install redis-tools