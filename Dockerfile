FROM node:18-slim
WORKDIR /app
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*
COPY bookmyshow-app/package*.json ./
RUN npm install && npm install chokidar
COPY bookmyshow-app/ .
ENV HOST=0.0.0.0
ENV NODE_OPTIONS=--openssl-legacy-provider
ENV CHOKIDAR_USEPOLLING=true
EXPOSE 3000
CMD ["npm", "start"]
