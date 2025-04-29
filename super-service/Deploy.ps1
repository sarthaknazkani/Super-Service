param (
    [string]$Tag,
    [string]$Token
)

# Navigate to the super-service directory
Set-Location -Path "super-service"

# Build the Docker image with the provided tag
docker build -t "super-service:$Tag" . --no-cache
echo $Token | docker login ghcr.io -u sarthaknazkani --password-stdin

# Push the Docker image to GHCR
docker push "ghcr.io/sarthaknazkani/super-service:$Tag"


