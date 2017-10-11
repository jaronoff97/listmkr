FROM jaronoff/listmkr-prod
# Remove the default nginx index.html
RUN rm -rf /var/www/html/index.nginx-debian.html

RUN npm run deploy:prod
# Copy the contents of the dist directory over to the nginx web root

RUN ls dist

COPY dist/* /var/www/html/
# Expose the public http port
EXPOSE 80
# Start server
CMD ["nginx", "-g", "daemon off;"]
