FROM node:20-alpine

WORKDIR /app

# Install backend dependencies
COPY package*.json ./
RUN npm install

# Copy entire project
COPY . .

# Build frontend
WORKDIR /app/client
RUN npm install --legacy-peer-deps
RUN npm run build

# Return to backend root
WORKDIR /app

EXPOSE 3000

CMD ["node", "server.js"]