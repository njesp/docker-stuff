#!/usr/bin/env bash
# Deploy multi container app til Azure App Services
az login
az account set --subscription "Visual Studio Enterprise"
az group delete --name resGrpDockerApps --yes
az group create --name resGrpDockerApps --location "West Europe"
az appservice plan create --name DockerizedAppServicePlan --resource-group resGrpDockerApps --sku B1 --is-linux
az webapp create --resource-group resGrpDockerApps --plan DockerizedAppServicePlan --name njn-DockerizedMultiImage --multicontainer-config-type compose --multicontainer-config-file docker-compose.yml
echo Sig nej hvis der ikke skal ryddes op endnu
echo
az group delete --name resGrpDockerApps
#