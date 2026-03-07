FROM node:18

WORKDIR /app


COPY package*.json ./

RUN npm init express

RUN npm install


COPY . .

# Expose the port the app runs on
EXPOSE 3001

# Define the command to run the application
CMD ["node", "index.js"]
