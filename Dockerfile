# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:10.0-preview AS build
WORKDIR /src

# Copy solution & project files
COPY UserCenter.sln ./
COPY src/UserCenter.Api/UserCenter.Api.csproj src/UserCenter.Api/
COPY src/UserCenter.Domain/UserCenter.Domain.csproj src/UserCenter.Domain/
COPY src/UserCenter.Application/UserCenter.Application.csproj src/UserCenter.Application/
COPY src/UserCenter.Infrastructure/UserCenter.Infrastructure.csproj src/UserCenter.Infrastructure/
COPY src/UserCenter.Shared/UserCenter.Shared.csproj src/UserCenter.Shared/

# Restore
RUN dotnet restore

# Copy remaining source
COPY src/ ./src/

# Publish
RUN dotnet publish src/UserCenter.Api/UserCenter.Api.csproj \
    -c Release \
    -o /app \
    --no-restore

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:10.0-preview AS runtime
WORKDIR /app

# Create non-root user
RUN adduser --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080

COPY --from=build /app ./

ENTRYPOINT ["dotnet", "UserCenter.Api.dll"]
