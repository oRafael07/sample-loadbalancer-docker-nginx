FROM node:20-alpine3.19 AS build

WORKDIR /usr/src/app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build
RUN npm ci --production && npm cache clean --force

FROM node:20-alpine3.19

WORKDIR /usr/src/app
COPY --from=build /usr/src/app/package.json ./package.json
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules

CMD ["npm", "run", "start:prod"]