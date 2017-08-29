FROM tagplay/node-base

# Installing service configurations
ONBUILD COPY ./vendor/ /etc/services.d/

# Most of our service have a depency that lives on GitHub
RUN apk add --no-cache git

ENV NODE_ENV production

RUN mkdir /app
WORKDIR /app

ONBUILD COPY package.json /app/
ONBUILD RUN npm -q install --production --no-optional && npm cache clean --force
ONBUILD COPY . /app/

EXPOSE  8080
