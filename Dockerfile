FROM jaronoff/listmkr-prod
# Remove the default nginx index.html
RUN rm -rf /var/www/html/index.nginx-debian.html

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
 
# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install
 
# Bundle app source
COPY . /usr/src/app

RUN npm run deploy:prod
# Copy the contents of the dist directory over to the nginx web root
COPY dist/* /var/www/html/
# Expose the public http port
EXPOSE 80
# Start server
CMD ["nginx", "-g", "daemon off;"]
