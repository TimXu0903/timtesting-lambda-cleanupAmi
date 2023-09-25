FROM mcr.microsoft.com/dotnet/sdk:6.0
RUN mkdir /project
COPY . /project
WORKDIR /project
RUN dotnet restore
RUN dotnet build

CMD ["dotnet","run"]
