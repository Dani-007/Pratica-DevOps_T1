FROM node:22-slim

WORKDIR /app

COPY package*.json ./

RUN npm install --omit=dev

RUN npm install -g nodemon

COPY . .

EXPOSE 9001

CMD ["npm", "start"]
