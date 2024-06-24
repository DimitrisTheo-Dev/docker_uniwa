FROM node:21

WORKDIR /backend

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 5005
CMD [ "npm", "run", "start" ]