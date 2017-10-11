#!/bin/bash
if git diff-index --quiet HEAD --; then 
    set -o errexit; # Exit on error
echo Step 1/4: Creating production build;
    npm run deploy:prod;
echo Step 2/4: Archiving previous production image;
    now=$(date +"%m_%d_%Y");
    docker tag jaronoff/listmkr-prod:latest jaronoff/listmkr-prod:$now;
    docker push jaronoff/listmkr-prod:$now;
echo Step 3/4: Creating new production image;
    mv Dockerfile.prod.off Dockerfile;
    npm run build:prod;
    mv Dockerfile Dockerfile.prod.off;
    docker push jaronoff/listmkr-prod;
echo Step 4/4: Creating elastic beanstalk environment;
eb $1 listmkr-prod;
else
    echo Please commit your changes first.;
fi