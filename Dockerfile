FROM node:20
 
WORKDIR /app
 
COPY package*.json ./
RUN rm -rf node_modules 
RUN npm ci
COPY . .
 
EXPOSE 3000
 
CMD ["npm", "start"]
