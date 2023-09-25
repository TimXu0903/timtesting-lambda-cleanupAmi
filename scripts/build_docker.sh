#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WD=$PWD
cd $DIR/..
rm -rf bin

# Update the Docker commands to use the .NET 6.0 SDK
docker run --rm -v $HOME/.nuget:/root/.nuget -v $DIR/..:/project -w /project mcr.microsoft.com/dotnet/sdk:6.0 dotnet restore
docker run --rm -v $HOME/.nuget:/root/.nuget -v $DIR/..:/project -w /project mcr.microsoft.com/dotnet/sdk:6.0 dotnet publish

# Assuming your project targets net6.0 now, update the path below
cd bin/Debug/net6.0/publish && zip -r Base2.Lambdas.zip *
cd $WD
mv bin/Debug/net6.0/publish/Base2.Lambdas.zip .

