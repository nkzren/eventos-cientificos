FROM node:12-alpine

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./
RUN npm install

COPY . .
RUN cd front && npm install && npm run build

CMD npm start
