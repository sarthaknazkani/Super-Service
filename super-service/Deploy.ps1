param (
    [string]$Tag,
    [string]$Token
)

# # Navigate to the super-service directory
# Set-Location -Path "super-service"

# # Build the Docker image with the provided tag
# docker build -t "super-service:$Tag" . --no-cache
# echo $Token | docker login ghcr.io -u sarthaknazkani --password-stdin

# # Push the Docker image to GHCR
# docker push "ghcr.io/sarthaknazkani/super-service:$Tag"


# Set variables
$owner = "sarthaknazkani"              # GitHub username or org
$imageName = "super-service"                  # Name of your Docker image
$fullImageName = "ghcr.io/$owner/$imageName:$Tag"


docker login ghcr.io -u $owner -p $Token
Write-Host "Logged In"
# 2. Build Docker image
Write-Host "Building Docker image..."
docker build -t $imageName . --no-cache
# 3. Tag image for GHCR
Write-Host "Tagging image..."
docker tag $imageName $fullImageName
# 4. Push image to GHCR
Write-Host "Pushing image to GHCR..."
docker push $fullImageName
Write-Host "Image successfully pushed to GHCR as $fullImageName"

