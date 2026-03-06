FROM node:18-slim

WORKDIR /app

RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

COPY package.json package-lock.json ./

RUN npm install chokidar@3.5.3 watchpack-chokidar2 --save-dev --legacy-peer-deps
RUN npm install --legacy-peer-deps

COPY . .

ENV NODE_OPTIONS=--openssl-legacy-provider
ENV HOST=0.0.0.0
ENV PORT=3000
ENV BROWSER=none

EXPOSE 3000

CMD ["npm", "start"]
