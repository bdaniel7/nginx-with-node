FROM node:11.4

COPY *.json ./

RUN npm i -g @angular/cli \
	  && npm audit fix \
	  && npm install
