FROM node:11.4

MAINTAINER Daniel Blendea <bdaniel7@gmail.com>

COPY *.json ./build/

WORKDIR ./build

RUN npm i -g @angular/cli \	  
   && npm install
