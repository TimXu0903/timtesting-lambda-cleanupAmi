## FROM microsoft/dotnet:latest

FROM mcr.microsoft.com/dotnet/sdk:2.1

RUN mkdir /project
COPY . /project
WORKDIR /project
RUN dotnet restore
RUN dotnet build

CMD ["dotnet","run"]
