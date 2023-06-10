FROM node:16-alpine
WORKDIR /clans
# Copy and download dependencies
COPY package.json ./
RUN npm install
# Copy the source files into the image
COPY . .

CMD node ./app.js