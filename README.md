# Listmkr Frontend Application
This is the public repository for the listmkr application, the code started from https://github.com/mklinga/zen-example.git

## Contributing

This application is open source! If you want to add something to it please submit a pull request!

## Deployment


### PRODUCTION
This application is currently working with AWS's CodePipeline and CodeDeploy services. When a PR is merged into master the pipeline will run, build the docker container, and deploy the newest version to AWS.

### DEVOLPMENT
COMING SOON!!! The process will be very similar to the production process however, the test code will deploy to a seperate AWS instance and the docker container created will be tagged as listmkr-dev instead of listmkr-prod.