FROM node:20
 
WORKDIR /app
 
COPY package*.json ./
RUN npm cache clean --force
RUN rm -rf node_modules package-lock.json
RUN npm install --legacy-peer-deps
 
COPY . .
 
EXPOSE 3000
 
CMD ["npm", "start"]
