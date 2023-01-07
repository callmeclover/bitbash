FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /workspaces/bitbash
ENV VAR1=1
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent
COPY . .
EXPOSE 8888
EXPOSE 3000
RUN chown -R node /workspaces/bitbash
USER node
CMD ["npm", "start"]
