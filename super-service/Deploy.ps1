param (
    [string]$Tag
)

# Navigate to the super-service directory
Set-Location -Path "super-service"

# Build the Docker image with the provided tag
docker build -t "super-service:$Tag" . --no-cache

