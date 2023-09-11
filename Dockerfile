FROM node:16
WORKDIR /usr/src/app
COPY package.json ./
COPY package-lock.json ./

RUN if [ $(uname -m) = 'aarch64' ]; then \
  apt-get update && \
  apt-get -y install build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev; \
  fi

RUN npm ci

COPY src ./src
COPY tsconfig.json ./
COPY .babelrc ./

RUN npm run build

EXPOSE 43594
CMD [ "npm", "run", "start:standalone" ]
