#!/usr/bin/env bash
az login
az account set --subscription "Visual Studio Enterprise"
az group create --name resGrpDockerApps --location "West Europe"
az appservice plan create --name DockerizedAppServicePlan --resource-group resGrpDockerApps --sku B1 --is-linux
az webapp create --resource-group resGrpDockerApps --plan DockerizedAppServicePlan --name njn-DockerizedMultiImage --multicontainer-config-type compose --multicontainer-config-file docker-compose.yml
#az group delete --name resGrpDockerApps