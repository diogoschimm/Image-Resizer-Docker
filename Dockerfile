FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
RUN apt-get update \
    && apt-get install -y imagemagick \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["TesteDockerEscalavel.csproj", "./"]
RUN dotnet restore "./TesteDockerEscalavel.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "TesteDockerEscalavel.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "TesteDockerEscalavel.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TesteDockerEscalavel.dll"]
