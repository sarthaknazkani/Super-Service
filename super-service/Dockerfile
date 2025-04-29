
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

COPY src/*.csproj ./src/
COPY test/*.csproj ./test/
RUN dotnet restore src/SuperService.csproj

COPY . .

RUN dotnet publish src/SuperService.csproj -c Release -o out/build


FROM build-env AS test
WORKDIR /app
RUN dotnet test test/SuperService.UnitTests.csproj -c Release --no-build --verbosity normal

# Final stage/image for running the application
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app

COPY --from=build-env /app/out/build .

EXPOSE 80
# RUN adduser --disabled-password --gecos '' appuser
# USER appuser
ENTRYPOINT ["dotnet", "SuperService.dll"]