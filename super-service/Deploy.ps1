
param (
    [string]$Token
)

param (
    [string]$Tag
)

# Define your parameters
$owner = "sarthaknazkani"
$repo = "Super-Service"
$imageName = "super-service"

# Path to your Dockerfile
$dockerfilePath = "super-service/Dockerfile"

# Build the Docker image
docker build -t ghcr.io/${owner}/${repo}/${imageName}:${Tag} -f ${dockerfilePath} .

# Login to GHCR
echo $Token | docker login ghcr.io -u $owner --password-stdin

# Push the Docker image to GHCR
docker push ghcr.io/${owner}/${repo}/${imageName}:${Tag}
