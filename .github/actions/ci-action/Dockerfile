FROM mcr.microsoft.com/dotnet/sdk:latest AS build-env
ENV PATH $PATH:/root/.dotnet/tools
RUN dotnet tool install -g dotnet-ef  --version 5.0.6
RUN apt update -y
RUN dotnet tool install -g dotnet-format
RUN dotnet tool install -g dotnet-retire
RUN apt install -y build-essential
RUN apt -y install docker.io
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
