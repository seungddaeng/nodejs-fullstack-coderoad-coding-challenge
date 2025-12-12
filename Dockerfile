FROM node:20-alpine3.19

WORKDIR /app

COPY server/package*.json ./

RUN npm install

COPY server/ ./

RUN npm run build

ENV PORT=3000
EXPOSE 3000

CMD ["npm", "start"]
