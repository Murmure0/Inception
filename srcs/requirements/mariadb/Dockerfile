FROM debien:buster

RUN apt-get update \
    && apt-get upgrade 

    
WORKDIR /code

ENV PORT 3306

COPY package.json /code/package.json

RUN npm install

COPY . /code

CMD [ "node", "src/server.js" ]