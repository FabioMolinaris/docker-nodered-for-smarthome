FROM nodered/node-red

# Create app directory
WORKDIR /usr/src/node-red/

# Copy dependecies json 
# COPY package.json .
# COPY custom_nodes/ .

# Install dependencies which are not mentioned in the json file
RUN npm install node-red-contrib-telegrambot
RUN npm install node-red-node-twitter
RUN npm install node-red-contrib-ewelink
RUN npm install node-red-contrib-ical-events
RUN npm install node-red-node-sqlite
RUN npm install node-red-contrib-nighttime

# Update all packages
RUN npm update
RUN npm fund

# Start application
CMD [ "npm", "start", "--", "--userDir", "/data" ]