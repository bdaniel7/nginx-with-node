FROM node:11.04 as builder

#COPY publish/ app/
#RUN cd /app \
#	&& npm i -g @angular/cli \
#	&& npm install \
#	&& npm run build

# RUN ls -la /app
COPY . build/

RUN cd build \
  && npm i -g @angular/cli \
  && npm audit fix \
  && npm install \


FROM nginx:1.15.7 AS deploy

COPY nginx.conf /etc/nginx/conf.d/default.conf

# RUN ls -la /

COPY --from=builder publish/ /usr/share/nginx/html