# DevOps Interview Task

Thank you for taking the time to do our technical test. We need to deploy a new .NET Core Web API application using a docker container.

Write code to do the following:

1. Run the automated tests
2. Package the application as a docker image
3. Deploy and run the image locally or in a public cloud

Improvements can also be made. For example:

- Make any changes to the application you think are useful for a deploy process
- Host the application in a secure fashion

The application is included under [`.\super-service`](`.\super-service`).

Your solution should be triggered by a powershell script called `Deploy.ps1`.

## Submitting

Create a Git repository which includes instructions on how to run the solution.  


------------------------------------------------------------

# Super-Service
This is a .NET Application to return Date/Time of different Time Zones.

Solution for Local Deployment:
1. Trigger .github/workflows/trigger-ps.yaml (Build and Push Docker Image through Powershell), providing image tag as user input.
2. The powershell script 'Deploy.ps1' triggers which builds the Dockerfile image of the application using dotnet core 3.1.
3. The image is tagged and pushed to GHCR ghcr.io/sarthaknazkani/super-service , from where it can be pulled specifying the tag.
4. This image can be run locally in Docker Container and different timezones can be accessed at [controller]/[zone] . Example : /time/itc , /time/utc


-------------------------------------------------------------

Solution for Cloud:
1. Trigger .github/workflows/build-push-deploy-aws.yaml ( Build Push and Deploy Docker Image through AWS CLI), providing image tag as user input.
2. The image is built, pushed to Elastic Container Registry ( Private).
3. Image is pulled and Deployed to AWS App Runner Service.
4. App can be browsed at https://dttevesgwm.ap-south-1.awsapprunner.com/time/[zone]. Example : https://dttevesgwm.ap-south-1.awsapprunner.com/time/utc