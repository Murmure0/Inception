FROM alpine:3.15.5

WORKDIR /code

ENV PORT 3306

COPY package.json /code/package.json

RUN npm install

COPY . /code

CMD [ "node", "src/server.js" ]