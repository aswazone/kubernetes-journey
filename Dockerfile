
FROM node:18-alpine AS base
WORKDIR /app

# Install deps seperatly for caching
COPY package*.json package-lock.json ./
RUN npm ci --omit=dev

COPY . .

USER node
EXPOSE 3000
ENV NODE_ENV=production
CMD [ "npm", "start" ]