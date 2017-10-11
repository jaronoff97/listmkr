FROM jaronoff/listmkr-prod
# Remove the default nginx index.html
RUN rm -rf /var/www/html/index.nginx-debian.html

RUN npm run deploy:prod

RUN ls
# Copy the contents of the dist directory over to the nginx web root
COPY /dist/* /var/www/html/
# Expose the public http port
EXPOSE 80
# Start server
CMD ["nginx", "-g", "daemon off;"]
