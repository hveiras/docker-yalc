FROM node:14-alpine

RUN npm i -g nodemon
RUN npm i -g yalc

WORKDIR /app
COPY . /app

WORKDIR /app/dep
RUN yalc publish

WORKDIR /app/service
RUN yalc add dep
RUN npm install

CMD ["npm", "run", "start:dev"]
