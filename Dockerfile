FROM nodered/node-red

# Create app directory
WORKDIR /usr/src/node-red/

# Copy dependecies json 
COPY package.json .
# COPY custom_nodes/ .

# Install dependencies which are not mentioned in the json file
# RUN npm install 

# Install json dependencies
RUN npm install --unsafe-perm --no-update-notifier --no-fund 

# Update all 
RUN npm update
RUN npm update -g

# Start application
CMD [ "npm", "start", "--", "--userDir", "/data" ]