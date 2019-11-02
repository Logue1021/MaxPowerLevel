FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /src
COPY MaxPowerLevel/MaxPowerLevel.csproj MaxPowerLevel/
RUN dotnet restore MaxPowerLevel/MaxPowerLevel.csproj
COPY MaxPowerLevel/ MaxPowerLevel/

WORKDIR /src/MaxPowerLevel/
RUN dotnet build MaxPowerLevel.csproj -c Release -o /app

FROM build as publish
RUN dotnet publish MaxPowerLevel.csproj -c Release -o /app

FROM base AS final
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "MaxPowerLevel.dll"]
